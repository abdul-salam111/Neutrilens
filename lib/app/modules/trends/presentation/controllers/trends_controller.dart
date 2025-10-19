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
  final List<String> statesMode = ["This Week", "This Month", "This Year"];

  RxList<Trend> trendsData = <Trend>[].obs;

  final getTrendsModel = GetTrendsModel().obs;
  @override
  void onReady() async {
    // TODO: implement onReady
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
        trendsData.value = model.trend ?? [];

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
      case 0: // This Week
        startDate = now.subtract(Duration(days: now.weekday - 1)); // Monday
        endDate = startDate.add(
          Duration(days: 7),
        ); // Add 7 days to include the full week
        break;
      case 1: // This Month
        startDate = DateTime(now.year, now.month, 1);
        endDate = DateTime(
          now.year,
          now.month + 1,
          1,
        ); // First day of next month
        break;
      case 2: // This Year
        startDate = DateTime(now.year, 1, 1);
        endDate = DateTime(now.year + 1, 1, 1); // First day of next year
        break;
      default: // Last 7 days (including today)
        startDate = now.subtract(
          Duration(days: 6),
        ); // 7 days total including today
        endDate = now.add(Duration(days: 1)); // Include today
    }

    return {
      'startDate': DateFormat('yyyy-MM-dd').format(startDate),
      'endDate': DateFormat('yyyy-MM-dd').format(endDate),
    };
  }

  //chart data
  // Add chart data observables
  final RxList<ChartDataPoint> goodPicksChartData = <ChartDataPoint>[].obs;
  final RxList<String> bottomTitles = <String>[].obs;
  final RxList<String> leftTitles = <String>[].obs;
  final RxDouble minX = 0.0.obs;
  final RxDouble maxX = 0.0.obs;
  final RxDouble minY = 0.0.obs;
  final RxDouble maxY = 0.0.obs;
  // Add this method to your TrendsController class

  void prepareChartData() {
    // Clear previous data
    goodPicksChartData.clear();
    bottomTitles.clear();
    leftTitles.clear();

    if (trendsData.isEmpty) {
      // Set default values if no data
      minX.value = 0.0;
      maxX.value = 1.0;
      minY.value = 0.0;
      maxY.value = 100.0;

      // Add some default left titles for empty state
      leftTitles.addAll(['0', '25', '50', '75', '100']);
      return;
    }

    // Sort trends by date to ensure chronological order
    final sortedTrends = List<Trend>.from(trendsData)
      ..sort(
        (a, b) =>
            (a.date ?? DateTime.now()).compareTo(b.date ?? DateTime.now()),
      );

    // Prepare data points
    double maxGoodPicks = 0.0;
    double minGoodPicks = double.infinity;

    for (int i = 0; i < sortedTrends.length; i++) {
      final trend = sortedTrends[i];
      final goodPicks = (trend.goodPicksCount ?? 0).toDouble();

      // Track min and max values for Y-axis scaling
      if (goodPicks > maxGoodPicks) {
        maxGoodPicks = goodPicks;
      }
      if (goodPicks < minGoodPicks) {
        minGoodPicks = goodPicks;
      }

      // Create chart data point
      // X coordinate: index position (0, 1, 2, ...)
      // Y coordinate: good picks count
      goodPicksChartData.add(ChartDataPoint(i.toDouble(), goodPicks));

      // Prepare bottom titles (date labels)
      final date = trend.date;
      if (date != null) {
        String dateLabel;
        switch (selectedStatesMode.value) {
          case 0: // This Week - show day names
            dateLabel = _getDayName(date);
            break;
          case 1: // This Month - show day numbers
            dateLabel = DateFormat('d').format(date);
            break;
          case 2: // This Year - show month names
            dateLabel = DateFormat('MMM').format(date);
            break;
          default:
            dateLabel = DateFormat('MMM d').format(date);
        }
        bottomTitles.add(dateLabel);
      } else {
        bottomTitles.add('${i + 1}');
      }
    }

    // Prepare left titles (Y-axis labels)
    _prepareLeftTitles(minGoodPicks, maxGoodPicks);

    // Set chart boundaries
    minX.value = 0.0;
    maxX.value = (sortedTrends.length > 1 ? sortedTrends.length - 1 : 1)
        .toDouble();
    minY.value = 0.0; // Always start from 0 for better visualization
    maxY.value = _calculateNiceMaxY(maxGoodPicks);
  }

  String _getDayName(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final chartDate = DateTime(date.year, date.month, date.day);

    if (chartDate == today) {
      return 'Today';
    } else if (chartDate == today.subtract(Duration(days: 1))) {
      return 'Yesterday';
    }
    return DateFormat('E').format(date); // Mon, Tue, etc.
  }

  void _prepareLeftTitles(double minValue, double maxValue) {
    leftTitles.clear();

    if (maxValue == 0) {
      leftTitles.addAll(['0', '25', '50', '75', '100']);
      return;
    }

    // Calculate nice intervals for Y-axis
    final double maxYValue = _calculateNiceMaxY(maxValue);
    final double interval = _calculateNiceInterval(maxYValue);
    final int numberOfTicks = (maxYValue / interval).ceil();

    for (int i = 0; i <= numberOfTicks; i++) {
      final value = (i * interval).round().toDouble();
      leftTitles.add(value.toStringAsFixed(value % 1 == 0 ? 0 : 1));
    }
  }

  double _calculateNiceMaxY(double maxValue) {
    if (maxValue == 0) return 100.0;

    // Calculate a nice max value that's slightly above the actual max
    final double magnitude = pow(
      10,
      maxValue.floor().toString().length - 1,
    ).toDouble();
    final double normalized = maxValue / magnitude;

    if (normalized <= 1) return 1 * magnitude;
    if (normalized <= 2) return 2 * magnitude;
    if (normalized <= 5) return 5 * magnitude;
    if (normalized <= 10) return 10 * magnitude;
    return ((maxValue / 10).ceil() * 10).toDouble();
  }

  double _calculateNiceInterval(double maxValue) {
    if (maxValue <= 10) return 2;
    if (maxValue <= 20) return 5;
    if (maxValue <= 50) return 10;
    if (maxValue <= 100) return 20;
    if (maxValue <= 200) return 50;
    if (maxValue <= 500) return 100;
    return 200;
  }

  // Add this helper method to check if we have chart data
  bool get hasChartData => goodPicksChartData.isNotEmpty;
}
