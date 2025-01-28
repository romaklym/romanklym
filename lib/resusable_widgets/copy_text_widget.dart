import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CopyTextWidget extends StatelessWidget {
  final String copyText;
  final double padding;
  final double addressIconSize;
  final double addressFontSize;
  final double contWidth;
  final String address; // Address to be copied

  const CopyTextWidget({
    super.key,
    required this.copyText,
    this.padding = 8,
    this.addressIconSize = 16.0,
    this.addressFontSize = 14.0,
    this.contWidth = 300,
    this.address =
        "0x532f27101965dd16442E59d40670FaF5eBB142E4", // Default address
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding * 2),
      child: GestureDetector(
        onTap: () async {
          final messenger = ScaffoldMessenger.of(context);
          await Clipboard.setData(ClipboardData(text: address));
          messenger.showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: const Color(0xFFFFC978), // Styling
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: const BorderSide(color: Colors.black54, width: 2),
              ),
              content: const Text(
                "Address copied to clipboard!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Audiowide",
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Container(
            width: contWidth,
            decoration: BoxDecoration(
              color: const Color(0xFF1E8EC0),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: const Color(0xFF704214),
                width: 2.0,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF704214),
                  offset: Offset(5, 5),
                  blurRadius: 0,
                ),
              ],
            ),
            padding: EdgeInsets.all(padding + 2), // Use instance variable
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(
                    FontAwesomeIcons.copy,
                    color: Colors.white70,
                    size: addressIconSize, // Use instance variable
                  ),
                  SizedBox(width: padding * 2), // Use instance variable
                  Text(
                    address, // Use the configurable address
                    style: TextStyle(
                      color: Colors.white70,
                      fontFamily: "Audiowide",
                      fontWeight: FontWeight.bold,
                      fontSize: addressFontSize, // Use instance variable
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
