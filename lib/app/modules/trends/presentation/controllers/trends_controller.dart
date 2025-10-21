import 'dart:math';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:neutri_lens/app/modules/trends/data/model/get_trends_model/get_trends_model.dart';
import 'package:neutri_lens/app/modules/trends/data/repository/abstract_repository/trends_abstract_repository.dart';

import '../views/good_pickes_chart_widget.dart';

class TrendsController extends GetxController {
  final TrendsAbstractRepository repository;

  TrendsController({required this.repository});
  final selectedDate = "".obs;
  final RxInt selectedStatesMode = 0.obs;
  final List<String> statesMode = ["Today", "This Week", "This Month"];

  RxList<Entry> entriesData = <Entry>[].obs;

  final getTrendsModel = GetTrendsModel().obs;
  
  @override
  void onReady() async {
    super.onReady();
    await getTrendsToDisplay();
  }

  var isloading = false.obs;
  var goodPickAvg = 0.0.obs;
  var mediumPickAvg = 0.0.obs;
  var poorPickAvg = 0.0.obs;
  var totalPickAvg = 0.0.obs;
  
  Future getTrendsToDisplay() async {
    isloading.value = true;
    Map<String, String> dateRange = getDateRange();
    String startDate = dateRange['startDate']!;
    String endDate = dateRange['endDate']!;

    final response = await repository.getTrends(startDate, endDate);

    response.fold(
      (failure) {
        isloading.value = false;
      },
      (model) {
        getTrendsModel.value = model;
        entriesData.value = model.entries ?? [];

        // Multiply by 100 to convert decimals to actual percentages
        goodPickAvg.value = (model.goodPickAvg!.toDouble() * 100);
        mediumPickAvg.value = (model.mediumPickAvg!.toDouble() * 100);
        poorPickAvg.value = (model.poorPickAvg!.toDouble() * 100);

        // Calculate total average (already in percentage form)
        totalPickAvg.value =
            ((goodPickAvg.value + mediumPickAvg.value + poorPickAvg.value) / 3);
        
        // Prepare chart data after receiving the response
        prepareChartData();
        isloading.value = false;
      },
    );
  }

  /// Get date range based on selected mode
  Map<String, String> getDateRange() {
    DateTime now = DateTime.now();
    DateTime startDate;
    DateTime endDate = now;

    switch (selectedStatesMode.value) {
      case 0: // Today
        startDate = DateTime(now.year, now.month, now.day);
        endDate = startDate.add(Duration(days: 1));
        break;
      case 1: // This Week
        startDate = now.subtract(Duration(days: now.weekday - 1));
        endDate = startDate.add(Duration(days: 7));
        break;
      case 2: // This Month
        startDate = DateTime(now.year, now.month, 1);
        endDate = DateTime(now.year, now.month + 1, 1);
        break;
      default:
        startDate = DateTime(now.year, now.month, now.day);
        endDate = startDate.add(Duration(days: 1));
    }

    return {
      'startDate': DateFormat('yyyy-MM-dd').format(startDate),
      'endDate': DateFormat('yyyy-MM-dd').format(endDate),
    };
  }

  // Chart data observables
  final RxList<ChartDataPoint> foodIqChartData = <ChartDataPoint>[].obs;
  final RxList<String> timeLabels = <String>[].obs;
  final RxDouble minX = 0.0.obs;
  final RxDouble maxX = 0.0.obs;
  final RxDouble minY = 0.0.obs;
  final RxDouble maxY = 100.0.obs; // Food IQ Score ranges from 0-100

  void prepareChartData() {
    // Clear previous data
    foodIqChartData.clear();
    timeLabels.clear();

    if (entriesData.isEmpty) {
      // Set default values if no data
      minX.value = 0.0;
      maxX.value = 1.0;
      minY.value = 0.0;
      maxY.value = 100.0;
      return;
    }

    // Sort entries by scanned_at time
    final sortedEntries = List<Entry>.from(entriesData)
      ..sort((a, b) {
        final timeA = _parseDateTime(a.scannedAt);
        final timeB = _parseDateTime(b.scannedAt);
        return timeA.compareTo(timeB);
      });

    // Prepare data points
    for (int i = 0; i < sortedEntries.length; i++) {
      final entry = sortedEntries[i];
      final foodIqScore = entry.foodIqScore?.toDouble() ?? 0.0;
      final scannedAt = entry.scannedAt;

      // Create chart data point
      foodIqChartData.add(ChartDataPoint(i.toDouble(), foodIqScore));

      // Prepare time labels for X-axis
      if (scannedAt != null) {
        final dateTime = _parseDateTime(scannedAt);
        timeLabels.add(_formatTimeForDisplay(dateTime));
      } else {
        timeLabels.add('${i + 1}');
      }
    }

    // Set chart boundaries
    minX.value = 0.0;
    maxX.value = (sortedEntries.length > 1 ? sortedEntries.length - 1 : 1).toDouble();
    minY.value = 0.0;
    maxY.value = 100.0; // Food IQ Score is always 0-100
  }

  DateTime _parseDateTime(String? dateTimeString) {
    if (dateTimeString == null) return DateTime.now();
    try {
      return DateTime.parse(dateTimeString);
    } catch (e) {
      return DateTime.now();
    }
  }

  String _formatTimeForDisplay(DateTime dateTime) {
    switch (selectedStatesMode.value) {
      case 0: // Today - show time like 10:43 AM
        return DateFormat('h:mm a').format(dateTime);
      case 1: // This Week - show day and time
        return DateFormat('E h:mm a').format(dateTime);
      case 2: // This Month - show date and time
        return DateFormat('MMM d h:mm a').format(dateTime);
      default:
        return DateFormat('h:mm a').format(dateTime);
    }
  }

  // Helper method to check if we have chart data
  bool get hasChartData => foodIqChartData.isNotEmpty;
}