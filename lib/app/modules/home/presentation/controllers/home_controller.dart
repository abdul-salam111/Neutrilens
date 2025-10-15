import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neutri_lens/app/modules/home/data/repository/home_repository.dart';
import '../../data/models/get_all_products_model.dart';

class HomeController extends GetxController {
  final searchController = TextEditingController();
  final HomeRepository productsRepository;
  final ScrollController scrollController = ScrollController();

  HomeController({required this.productsRepository});

  final RxBool isLoading = false.obs;
  final RxBool isLoadingMore = false.obs;
  final RxString errorMessage = ''.obs;
  final RxInt currentPage = 1.obs;
  final RxBool hasMoreData = true.obs;
  final RxString searchQuery = ''.obs; // Store current search query

  final RxList<Product> products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    getProducts();
    _setupScrollListener();
    _setupSearchListener(); // Listen to search field changes
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
    // Listen to text changes in search field
    searchController.addListener(() {
      // Debounce: wait 500ms after user stops typing before searching
      _debounceSearch();
    });
  }

  // Debounce timer to avoid searching on every keystroke
  void _debounceSearch() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (searchController.text != searchQuery.value) {
        performSearch(searchController.text);
      }
    });
  }

  // Perform search
  void performSearch(String query) {
    searchQuery.value = query.trim();
    currentPage.value = 1;
    products.clear();
    hasMoreData.value = true;

    if (searchQuery.value.isEmpty) {
      // If search is empty, load all products
      getProducts();
    } else {
      // If there's a search query, search products
      searchProducts();
    }
  }

  Future<void> getProducts({bool refresh = false}) async {
    if (refresh) {
      currentPage.value = 1;
      products.clear();
      hasMoreData.value = true;
      searchQuery.value = '';
      searchController.clear(); // Clear search field on refresh
    }

    isLoading.value = true;
    errorMessage.value = '';

    final result = await productsRepository.getProducts(
      page: currentPage.value,
    );

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

  Future<void> searchProducts() async {
    isLoading.value = true;
    errorMessage.value = '';

    final result = await productsRepository.searchProducts(
      query: searchQuery.value,
      page: currentPage.value,
    );

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

    // Check if we're searching or loading all products
    final result = searchQuery.value.isEmpty
        ? await productsRepository.getProducts(page: currentPage.value)
        : await productsRepository.searchProducts(
            query: searchQuery.value,
            page: currentPage.value,
          );

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

  // Clear search and show all products
  void clearSearch() {
    searchController.clear();
    searchQuery.value = '';
    currentPage.value = 1;
    products.clear();
    hasMoreData.value = true;
    getProducts();
  }

  @override
  void onClose() {
    searchController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
