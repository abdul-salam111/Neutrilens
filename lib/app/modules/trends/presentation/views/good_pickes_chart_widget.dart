// ignore_for_file: deprecated_member_use

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';

// Model class to hold chart data
class ChartDataPoint {
  final double x;
  final double y;

  ChartDataPoint(this.x, this.y);
}

class GoodPicksChart extends StatefulWidget {
  final List<ChartDataPoint> dataPoints;
  final List<String>? bottomTitles; // Month labels
  final List<String>? leftTitles; // Y-axis labels
  final double? minX;
  final double? maxX;
  final double? minY;
  final double? maxY;
  final Color? lineColor;
  final double? lineWidth;
  final bool showDots;
  final bool isCurved;

  const GoodPicksChart({
    super.key,
    required this.dataPoints,
    this.bottomTitles,
    this.leftTitles,
    this.minX,
    this.maxX,
    this.minY,
    this.maxY,
    this.lineColor,
    this.lineWidth = 5,
    this.showDots = false,
    this.isCurved = true,
  });

  @override
  State<GoodPicksChart> createState() => _GoodPicksChartState();
}

class _GoodPicksChartState extends State<GoodPicksChart> {
  List<Color> get gradientColors => [
    widget.lineColor ?? AppColors.appPrimaryColor,
    widget.lineColor ?? AppColors.appPrimaryColor,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 30,
              left: 30,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(mainData()),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final style = context.bodySmall!.copyWith(color: AppColors.greyColor);

    // If custom titles provided, use them
    if (widget.bottomTitles != null && widget.bottomTitles!.isNotEmpty) {
      final index = value.toInt();
      if (index >= 0 && index < widget.bottomTitles!.length) {
        return SideTitleWidget(
          meta: meta,

          child: Text(widget.bottomTitles![index], style: style),
        );
      }
      return SideTitleWidget(
        meta: meta,
        child: Text('', style: style),
      );
    }

    // Default behavior
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = Text('MAR', style: style);
        break;
      case 5:
        text = Text('JUN', style: style);
        break;
      case 8:
        text = Text('SEP', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(meta: meta, child: text);
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    final style = context.bodySmall!.copyWith(
      color: AppColors.greyColor,
      fontSize: 12,
    );

    // If custom titles provided, use them
    if (widget.leftTitles != null && widget.leftTitles!.isNotEmpty) {
      // Find the closest value in leftTitles
      for (int i = 0; i < widget.leftTitles!.length; i++) {
        final titleValue = double.tryParse(widget.leftTitles![i]) ?? 0;
        if ((value - titleValue).abs() < 1) {
          // Allow small rounding differences
          return SideTitleWidget(
            meta: meta,
            child: Container(
              margin: EdgeInsets.only(right: 8),
              child: Text(widget.leftTitles![i], style: style),
            ),
          );
        }
      }
    }

    // Fallback: Show the actual Y value
    return SideTitleWidget(
      meta: meta,
      child: Container(
        margin: EdgeInsets.only(right: 8),
        child: Text(value.toStringAsFixed(0), style: style),
      ),
    );
  }

  // Calculate min/max values from data if not provided
  double get _minX =>
      widget.minX ??
      (widget.dataPoints.isNotEmpty
          ? widget.dataPoints.map((p) => p.x).reduce((a, b) => a < b ? a : b)
          : 0.0);

  double get _maxX =>
      widget.maxX ??
      (widget.dataPoints.isNotEmpty
          ? widget.dataPoints.map((p) => p.x).reduce((a, b) => a > b ? a : b)
          : 1.0);

  double get _minY => widget.minY ?? 0;

  double get _maxY =>
      widget.maxY ??
      (widget.dataPoints.isNotEmpty
          ? _calculateMaxY(widget.dataPoints.map((p) => p.y).toList())
          : 100.0);

  // Calculate max Y with proper intervals to avoid overlapping
  double _calculateMaxY(List<double> yValues) {
    if (yValues.isEmpty) return 100.0;

    final maxValue = yValues.reduce((a, b) => a > b ? a : b);

    // Calculate a nice max value that prevents label overlapping
    if (maxValue <= 10) return maxValue * 1.2;
    if (maxValue <= 50) return (maxValue / 10).ceil() * 10.0 * 1.2;
    if (maxValue <= 100) return (maxValue / 25).ceil() * 25.0 * 1.2;
    return (maxValue / 50).ceil() * 50.0 * 1.2;
  }

  // Calculate appropriate interval for Y-axis
  double get _yInterval {
    final range = _maxY - _minY;
    if (range <= 10) return 2;
    if (range <= 50) return 10;
    if (range <= 100) return 20;
    if (range <= 200) return 40;
    return 100;
  }

  LineChartData mainData() {
    // Convert data points to FlSpot
    final spots = widget.dataPoints
        .map((point) => FlSpot(point.x, point.y))
        .toList();

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        drawHorizontalLine: true,
        horizontalInterval: _yInterval,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: AppColors.lightGreyColor.withOpacity(0.3),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: _calculateXInterval(),
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 20, // Increased reserved space
            interval: _yInterval,
            getTitlesWidget: leftTitleWidgets,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: _minX,
      maxX: _maxX,
      minY: _minY,
      maxY: _maxY,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: widget.isCurved,
          gradient: LinearGradient(colors: gradientColors),
          barWidth: widget.lineWidth!,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: widget.showDots,

            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 4,
                color: Colors.white,
                strokeWidth: 2,
                strokeColor: widget.lineColor ?? AppColors.appPrimaryColor,
              );
            },
          ),
          belowBarData: BarAreaData(show: false),
        ),
      ],
    );
  }

  double _calculateXInterval() {
    final range = _maxX - _minX;
    if (range <= 5) return 1;
    if (range <= 10) return 2;
    if (range <= 20) return 3;
    return 4;
  }
}
