import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LocationDialog extends StatefulWidget {
  final double width;
  final double height;
  final VoidCallback onToggleWelcomeWindow;
  final Function(double, double)? onPositionChanged;
  final Map<String, bool> windowVisibility;

  const LocationDialog({
    super.key,
    this.width = 300,
    this.height = 300,
    required this.onToggleWelcomeWindow,
    this.onPositionChanged,
    required this.windowVisibility,
  });

  @override
  State<LocationDialog> createState() => _LocationDialogState();
}

class _LocationDialogState extends State<LocationDialog> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Invisible full-screen GestureDetector to handle clicks outside
        Positioned.fill(
          child: GestureDetector(
            onTap: widget.onToggleWelcomeWindow,
            behavior: HitTestBehavior.translucent,
          ),
        ),
        // Actual dialog content
        Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF5DC),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: const Color(0xFF704214),
                  width: 2.0,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFF704214),
                    offset: Offset(-5, 5),
                    blurRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Dialog content
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.locationDot,
                            color: Color(0xFF704214),
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Uzhhorod, Ukraine',
                            style: TextStyle(
                              fontFamily: "Audiowide",
                              fontSize: 24,
                              color: Color(0xFF704214),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
