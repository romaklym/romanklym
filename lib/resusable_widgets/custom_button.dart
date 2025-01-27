import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color activeColor;
  final Color inactiveColor;
  final String? label; // Optional label
  final IconData? icon; // Optional icon
  final VoidCallback onTap;
  final String? windowKey; // Optional parameter
  final Map<String, bool>? windowVisibility; // Optional parameter
  final double fontSize;
  final double iconSize;

  const CustomButton({
    super.key,
    required this.activeColor,
    required this.inactiveColor,
    this.label, // Label is now optional
    this.icon, // Icon is now optional
    required this.onTap,
    this.windowKey,
    this.windowVisibility,
    this.fontSize = 12.0,
    this.iconSize = 16.0, // Default size for icons
  }) : assert(label != null || icon != null,
            'Either label or icon must be provided.');

  @override
  Widget build(BuildContext context) {
    // Determine button color based on visibility or fallback to default
    final buttonColor = (windowVisibility != null &&
            windowKey != null &&
            windowVisibility![windowKey] == true)
        ? activeColor // Active color
        : inactiveColor; // Default inactive color

    final iconColor = (windowVisibility != null &&
            windowKey != null &&
            windowVisibility![windowKey] == true)
        ? Colors.white70 // Active color
        : Colors.black54;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF704214), // Shadow color
            offset: const Offset(-5, 5),
            blurRadius: 0,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: buttonColor, // Use determined button color
            border: Border.all(color: Colors.black54, width: 1.5),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Display either label or icon
              if (icon != null) ...[
                Icon(
                  icon,
                  color: iconColor,
                  size: iconSize,
                ),
                SizedBox(width: 8.0),
              ],
              if (label != null)
                Text(
                  label!,
                  style: TextStyle(
                    fontFamily: "Audiowide",
                    fontSize: fontSize,
                    color: iconColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
