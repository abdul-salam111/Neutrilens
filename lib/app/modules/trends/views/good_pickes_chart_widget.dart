import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

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
              right: 18,
              left: 12,
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
    final style = context.bodySmall!.copyWith(color: AppColors.darkGreyColor);

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
    final style = context.bodySmall!.copyWith(color: AppColors.darkGreyColor);

    // If custom titles provided, use them
    if (widget.leftTitles != null && widget.leftTitles!.isNotEmpty) {
      final index = value.toInt();
      if (index >= 0 && index < widget.leftTitles!.length) {
        return Text(
          widget.leftTitles![index],
          style: style,
          textAlign: TextAlign.left,
        );
      }
      return Container();
    }

    // Default behavior
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  // Calculate min/max values from data if not provided
  double get _minX =>
      widget.minX ??
      widget.dataPoints.map((p) => p.x).reduce((a, b) => a < b ? a : b);

  double get _maxX =>
      widget.maxX ??
      widget.dataPoints.map((p) => p.x).reduce((a, b) => a > b ? a : b);

  double get _minY => widget.minY ?? 0;

  double get _maxY =>
      widget.maxY ??
      widget.dataPoints.map((p) => p.y).reduce((a, b) => a > b ? a : b) * 1.2;

  LineChartData mainData() {
    // Convert data points to FlSpot
    final spots = widget.dataPoints
        .map((point) => FlSpot(point.x, point.y))
        .toList();

    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: false,
        drawHorizontalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(color: AppColors.appPrimaryColor, strokeWidth: 1);
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(color: AppColors.appPrimaryColor, strokeWidth: 1);
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
            interval: 1,
            showTitles: false,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            interval: 1,
            showTitles: false,
            reservedSize: 42,
            getTitlesWidget: leftTitleWidgets,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
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
          dotData: FlDotData(show: widget.showDots),
          belowBarData: BarAreaData(show: false),
        ),
      ],
    );
  }
}
