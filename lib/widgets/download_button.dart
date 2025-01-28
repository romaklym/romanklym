import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DownloadButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final Color backgroundColor; // Background color for the button
  final Color iconColor; // Icon color

  const DownloadButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.backgroundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Trigger the provided onPressed callback
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor, // Background color
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: const Color(0xFF704214), // Border color
            width: 2.0, // Border thickness
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF704214), // Shadow color
              offset: const Offset(5, 5),
              blurRadius: 0,
            ),
          ],
        ),
        width: 250, // Consistent width
        height: 50, // Consistent height
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              icon,
              color: iconColor,
              size: 20, // Icon size
            ),
            const SizedBox(width: 8), // Space between icon and text
            Text(
              label,
              style: TextStyle(
                fontFamily: "Audiowide",
                color: iconColor,
                fontSize: 14, // Text size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
