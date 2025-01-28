import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawerButton extends StatefulWidget {
  final VoidCallback onTap; // Add the onTap parameter

  const CustomDrawerButton({
    super.key,
    required this.onTap, // Make onTap a required parameter
  });

  @override
  State<CustomDrawerButton> createState() => _CustomDrawerButtonState();
}

class _CustomDrawerButtonState extends State<CustomDrawerButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFC978), // Retro beige background color
            borderRadius: BorderRadius.circular(8), // Rounded corners
            border: Border.all(
              color: const Color(0xFF704214), // Brown border color
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
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
            child: FaIcon(
              FontAwesomeIcons.bars,
              size: 16,
              color: const Color(0xFF704214),
            ),
          ),
        ),
      ),
    );
  }
}
