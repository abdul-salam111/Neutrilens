import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neutri_lens/app/modules/home/domain/abstract_repositories/home_repository.dart';
import '../../data/models/get_all_products_model.dart';

class HomeController extends GetxController {
  final searchController = TextEditingController();
  final HomeRepository homeRepository;
  final ScrollController scrollController = ScrollController();

  HomeController({required this.homeRepository});

  final RxBool isLoading = false.obs;
  final RxBool isLoadingMore = false.obs;
  final RxString errorMessage = ''.obs;
  final RxInt currentPage = 1.obs;
  final RxBool hasMoreData = true.obs;
  final RxString searchQuery = ''.obs;

  // Add this to track the current search operation
  final RxString _currentOperationId = ''.obs;
  
  final RxList<Product> products = <Product>[].obs;

  Timer? _searchTimer;

  @override
  void onInit() {
    super.onInit();
    getProducts();
    _setupScrollListener();
    _setupSearchListener();
  }

  void _setupScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent * 0.8 &&
          !isLoadingMore.value &&
          !isLoading.value &&
          hasMoreData.value) {
        loadMoreProducts();
      }
    });
  }

  void _setupSearchListener() {
    searchController.addListener(() {
      _debounceSearch();
    });
  }

  void _debounceSearch() {
    _searchTimer?.cancel();
    
    _searchTimer = Timer(const Duration(milliseconds: 500), () {
      if (searchController.text != searchQuery.value) {
        performSearch(searchController.text);
      }
    });
  }

  // Generate a unique ID for each search operation
  String _generateOperationId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  void performSearch(String query) {
    final trimmedQuery = query.trim();
    if (trimmedQuery == searchQuery.value) return;

    // Generate a new operation ID for this search
    final operationId = _generateOperationId();
    _currentOperationId.value = operationId;

    searchQuery.value = trimmedQuery;
    currentPage.value = 1;
    products.clear();
    hasMoreData.value = true;
    isLoading.value = true;

    if (searchQuery.value.isEmpty) {
      _getAllProducts(operationId);
    } else {
      _searchProducts(operationId);
    }
  }

  Future<void> _getAllProducts(String operationId) async {
    try {
      final result = await homeRepository.getProducts(page: 1);

      // Check if this operation is still the current one
      if (_currentOperationId.value != operationId) {
        return; // Ignore result if a newer operation has started
      }

      result.fold(
        (error) {
          errorMessage.value = error.toString();
          isLoading.value = false;
        },
        (response) {
          if (response.products != null && response.products!.isNotEmpty) {
            products.assignAll(response.products!);
            currentPage.value = 2; // Set to next page
          } else {
            hasMoreData.value = false;
          }
          isLoading.value = false;
        },
      );
    } catch (e) {
      if (_currentOperationId.value == operationId) {
        errorMessage.value = e.toString();
        isLoading.value = false;
      }
    }
  }

  Future<void> _searchProducts(String operationId) async {
    try {
      final result = await homeRepository.searchProducts(
        query: searchQuery.value,
        page: 1,
      );

      // Check if this operation is still the current one
      if (_currentOperationId.value != operationId) {
        return; // Ignore result if a newer operation has started
      }

      result.fold(
        (error) {
          errorMessage.value = error.toString();
          isLoading.value = false;
        },
        (response) {
          if (response.products != null && response.products!.isNotEmpty) {
            products.assignAll(response.products!);
            currentPage.value = 2; // Set to next page
          } else {
            hasMoreData.value = false;
          }
          isLoading.value = false;
        },
      );
    } catch (e) {
      if (_currentOperationId.value == operationId) {
        errorMessage.value = e.toString();
        isLoading.value = false;
      }
    }
  }

  Future<void> getProducts({bool refresh = false}) async {
    if (refresh) {
      currentPage.value = 1;
      products.clear();
      hasMoreData.value = true;
      searchQuery.value = '';
      searchController.clear();
      _currentOperationId.value = _generateOperationId();
    }

    isLoading.value = true;
    errorMessage.value = '';

    final operationId = _currentOperationId.value;
    final result = await homeRepository.getProducts(page: currentPage.value);

    // Check if operation is still valid
    if (_currentOperationId.value != operationId) return;

    result.fold(
      (error) {
        isLoading.value = false;
        errorMessage.value = error.toString();
      },
      (response) {
        if (response.products != null && response.products!.isNotEmpty) {
          products.addAll(response.products!);
          currentPage.value++;
        } else {
          hasMoreData.value = false;
        }
        isLoading.value = false;
      },
    );
  }

  Future<void> loadMoreProducts() async {
    if (!hasMoreData.value || isLoadingMore.value) return;

    isLoadingMore.value = true;
    errorMessage.value = '';

    final operationId = _currentOperationId.value;
    final result = searchQuery.value.isEmpty
        ? await homeRepository.getProducts(page: currentPage.value)
        : await homeRepository.searchProducts(
            query: searchQuery.value,
            page: currentPage.value,
          );

    // Check if operation is still valid
    if (_currentOperationId.value != operationId) {
      isLoadingMore.value = false;
      return;
    }

    result.fold(
      (error) {
        isLoadingMore.value = false;
        errorMessage.value = error.toString();
      },
      (response) {
        if (response.products != null && response.products!.isNotEmpty) {
          products.addAll(response.products!);
          currentPage.value++;
        } else {
          hasMoreData.value = false;
        }
        isLoadingMore.value = false;
      },
    );
  }

  Future<void> refreshProducts() async {
    await getProducts(refresh: true);
  }

  void clearSearch() {
    searchController.clear();
    searchQuery.value = '';
    currentPage.value = 1;
    products.clear();
    hasMoreData.value = true;
    _currentOperationId.value = _generateOperationId();
    getProducts();
  }

  @override
  void onClose() {
    _searchTimer?.cancel();
    searchController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}