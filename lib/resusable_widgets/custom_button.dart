import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  final Color activeColor;
  final Color inactiveColor;
  final String? label;
  final IconData? icon;
  final String? svgPath;
  final VoidCallback onTap;
  final String? windowKey;
  final Map<String, bool>? windowVisibility;
  final double fontSize;
  final double iconSize;

  const CustomButton({
    super.key,
    required this.activeColor,
    required this.inactiveColor,
    this.label,
    this.icon,
    this.svgPath,
    required this.onTap,
    this.windowKey,
    this.windowVisibility,
    this.fontSize = 12.0,
    this.iconSize = 16.0,
  }) : assert(icon != null || svgPath != null || label != null,
            'At least one of: icon, svgPath, or label must be provided.');

  @override
  Widget build(BuildContext context) {
    final buttonColor = (windowVisibility != null &&
            windowKey != null &&
            windowVisibility![windowKey] == true)
        ? activeColor
        : inactiveColor;

    final iconColor = (windowVisibility != null &&
            windowKey != null &&
            windowVisibility![windowKey] == true)
        ? Colors.white70
        : Colors.black54;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF704214),
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
            color: buttonColor,
            border: Border.all(color: Colors.black54, width: 1.5),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (svgPath != null)
                SvgPicture.asset(
                  svgPath!,
                  width: iconSize,
                  height: iconSize,
                  colorFilter: ColorFilter.mode(
                    iconColor,
                    BlendMode.srcIn,
                  ),
                ),
              if (icon != null)
                Icon(
                  icon,
                  color: iconColor,
                  size: iconSize,
                ),
              if (label != null) ...[
                const SizedBox(width: 8.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
