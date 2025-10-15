import 'dart:math';
import 'package:flutter/material.dart';
import 'package:neutri_lens/app/core/theme/theme.dart';

import '../theme/colors.dart';

class DaysCountdownCircle extends StatelessWidget {
  final int totalValue; // Total days
  final int obtainedValue; // Days obtained/completed

  const DaysCountdownCircle({
    super.key,
    required this.totalValue,
    required this.obtainedValue,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate progress: obtainedValue / totalValue
    final double progress = (obtainedValue / totalValue).clamp(0.0, 1.0);

    return Center(
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: progress),
        duration: const Duration(seconds: 1),
        builder: (context, value, child) {
          return CustomPaint(
            painter: _ArcPainter(value),
            child: SizedBox(
              width: 140,
              height: 140,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$obtainedValue",
                      style: context.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ArcPainter extends CustomPainter {
  final double progress; // 0.0 → 1.0

  _ArcPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 10.0;
    final center = size.center(Offset.zero);
    final radius = size.width / 2 - strokeWidth;

    final backgroundPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..color = AppColors.appPrimaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Full circle background
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi,
      false,
      backgroundPaint,
    );

    // Progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _ArcPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
