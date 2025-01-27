import 'package:flutter/material.dart';

class SquareStepContainer extends StatelessWidget {
  final String title;
  final String description;
  final IconData? icon;
  final double width;
  final double height;
  final Color? iconColor;
  final double fontSize;
  final double iconSize;
  final double tokenFontSize;

  const SquareStepContainer({
    super.key,
    required this.title,
    required this.description,
    this.icon,
    required this.width,
    required this.height,
    this.iconColor = const Color(0xFF704214),
    this.fontSize = 14.0,
    this.tokenFontSize = 12.0,
    this.iconSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // Uniform width
      height: height, // Uniform height
      padding: const EdgeInsets.all(12.0),
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
            offset: const Offset(-5, 5),
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
          Text(
            title,
            style: TextStyle(
              fontFamily: "Audiowide",
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: iconColor,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Center(
              child: Text(
                description,
                style: TextStyle(
                  fontFamily: "Audiowide",
                  fontSize: tokenFontSize,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center, // Center-align the text
                overflow: TextOverflow.clip, // Ensure text wraps
              ),
            ),
          ),
        ],
      ),
    );
  }
}
