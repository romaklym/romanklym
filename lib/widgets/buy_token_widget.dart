import 'package:flutter/material.dart';
import 'package:easy_web_view/easy_web_view.dart';

class BuyTokenDialog extends StatelessWidget {
  final String initialUrl;
  final double borderRadius; // Customizable border radius

  const BuyTokenDialog({
    super.key,
    required this.initialUrl,
    this.borderRadius = 12.0, // Default rounding
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFFFFF7D1),
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // WebView Container
          Flexible(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.height * 0.7,
              child: EasyWebView(
                src: initialUrl,
                isMarkdown: false,
                convertToWidgets: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
