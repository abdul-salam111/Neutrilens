 import 'package:flutter/material.dart';

Color getGradeColor(String grade) {
    switch (grade.toLowerCase()) {
      case 'a':
        return Colors.green; // 80-100: Excellent
      case 'b':
        return Colors.lightGreen; // 65-79: Good
      case 'c':
        return Colors.orangeAccent; // 50-64: Average
      case 'd':
        return Colors.deepOrange; // 35-49: Poor
      case 'e':
        return Colors.red; // 0-34: Very Poor
      default:
        return Colors.grey; // Unknown
    }
  }

  // Helper function to get grade text
  String getGradeText(String grade) {
    switch (grade.toLowerCase()) {
      case 'a':
        return "Good Pick"; // Excellent nutritional quality
      case 'b':
        return "Ok Pick"; // Good nutritional quality
      case 'c':
        return "Ok Pick"; // Average nutritional quality
      case 'd':
        return "Bad Pick"; // Poor nutritional quality
      case 'e':
        return "Don't Pick"; // Very poor nutritional quality
      default:
        return "Unknown";
    }
  }