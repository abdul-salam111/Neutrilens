import 'package:get/get.dart';

import '../views/good_pickes_chart_widget.dart';

class TrendsController extends GetxController {
  final selectedDate = "".obs;
  final RxInt selectedStatesMode = 0.obs;
  final List<String> statesMode = ["This Week", "This Month", "This Year"];

  List<ChartDataPoint> salesData = [
    ChartDataPoint(0, 3),
    ChartDataPoint(2.6, 2),
    ChartDataPoint(4.9, 5),
    ChartDataPoint(6.8, 3.1),
    ChartDataPoint(8, 4),
  ];
}

class SalesData {
  final double month;
  final double revenue;

  SalesData(this.month, this.revenue);
}

List<ChartDataPoint> convertToChartData(List<SalesData> sales) {
  return sales.map((s) => ChartDataPoint(s.month, s.revenue)).toList();
}
