import 'package:flutter/material.dart';
import 'package:klymroman/theme/app_colors.dart';

class AppTextStyles {
  static const appDrawerHeader = TextStyle(
    fontFamily: "Nabla",
    fontWeight: FontWeight.w900,
    fontSize: 32,
  );
  static const header = TextStyle(
    fontFamily: "Nabla",
    fontWeight: FontWeight.w900,
    fontSize: 32,
  );
  static const body = TextStyle(
    fontFamily: "Audiowide",
    fontWeight: FontWeight.normal,
    fontSize: 14,
    color: Colors.black54,
  );
  static const tickerTape = TextStyle(
    fontFamily: "Doto",
    fontSize: 14,
    fontWeight: FontWeight.w900,
    color: AppColors.tickerTapeTextColor, // Neon green text
    shadows: [
      Shadow(
        blurRadius: 10.0, // Glow effect
        color: AppColors.tickerTapeTextColor,
        offset: Offset(0, 0),
      ),
      Shadow(
        blurRadius: 20.0, // Extra glow
        color: AppColors.ticketTapeGlowColor,
        offset: Offset(0, 0),
      ),
    ],
  );
  static const appDrawerTextStyle = TextStyle(
    fontFamily: "Audiowide",
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteText,
  );
}
