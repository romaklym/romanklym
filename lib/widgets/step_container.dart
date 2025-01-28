import 'package:flutter/material.dart';

class StepContainer extends StatelessWidget {
  final String title;
  final String description;
  final double iconSize;
  final double fontSize;
  final double titleFontSize;
  final IconData? icon;
  final Color customColor;

  const StepContainer({
    super.key,
    required this.title,
    required this.description,
    this.iconSize = 20,
    this.titleFontSize = 16,
    this.fontSize = 14,
    this.icon,
    this.customColor = const Color(0xFF704214),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF5DC), // Background color
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF704214), // Border color
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF704214), // Shadow color
            offset: const Offset(5, 5),
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null)
            Icon(
              icon,
              color: customColor,
              size: iconSize,
            ),
          Text(
            title,
            style: TextStyle(
              fontFamily: "Audiowide",
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: customColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontFamily: "Audiowide",
              fontSize: fontSize,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
