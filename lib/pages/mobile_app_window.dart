import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klymroman/widgets/download_button.dart';
import 'package:url_launcher/url_launcher.dart';

class DesktopWindow extends StatelessWidget {
  final Widget content; // Content to display inside the window
  final String title; // Title of the window
  final double width;
  final double height;
  final bool isButtons;
  final double fontSize;
  final double iconSize;
  final double containerHeight;
  final double padding;
  final VoidCallback onToggleDesktopWindow;
  final Map<String, bool> windowVisibility;

  const DesktopWindow({
    super.key,
    required this.content,
    required this.title,
    required this.width,
    required this.height,
    required this.isButtons,
    this.fontSize = 16.0,
    this.iconSize = 18.0,
    this.containerHeight = 50.0,
    this.padding = 16.0,
    required this.onToggleDesktopWindow,
    required this.windowVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: const Color(0xFFFFF5DC), // Retro beige background
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                // Slim border added here
                color: const Color(0xFF704214), // Retro brown color
                width: 2.0, // Slim border width
              ), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF704214), // Shadow color
                  offset: const Offset(5, 5),
                  blurRadius: 0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Title Bar
                      Container(
                        height: containerHeight,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFC978), // Retro yellow-orange
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(4),
                          ),
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  const Color(0xFF704214), // Retro brown border
                              width: 2,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            // Title text
                            Padding(
                              padding: EdgeInsets.only(left: padding),
                              child: Text(
                                title,
                                style: TextStyle(
                                  fontFamily: "Audiowide",
                                  fontSize: fontSize,
                                  color: Color(0xFF704214),
                                ),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const FaIcon(
                                FontAwesomeIcons.squareMinus,
                                color: Color(0xFF704214),
                              ),
                              onPressed: onToggleDesktopWindow,
                              iconSize: iconSize,
                            ),
                            // Close button
                            IconButton(
                              icon: const FaIcon(
                                FontAwesomeIcons.squareXmark,
                                color: Colors.redAccent,
                              ),
                              onPressed: onToggleDesktopWindow,
                              iconSize: iconSize,
                            ),
                          ],
                        ),
                      ),

                      // Content Area
                      // Expanded(
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: content, // Pass in the custom content
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Download Buttons (Positioned relative to the whole window)
          if (isButtons)
            Positioned(
              right: 20,
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  DownloadButton(
                    label: "Download for iOS",
                    icon: FontAwesomeIcons.apple,
                    backgroundColor: const Color(0xFF51A0D5), // Sleek blue
                    iconColor: Colors.white,
                    onPressed: () async {
                      const url = 'https://www.apple.com/app-store/';
                      final uri = Uri.parse(url);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri,
                            mode: LaunchMode.externalApplication);
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  DownloadButton(
                    label: "Download for Android",
                    icon: FontAwesomeIcons.googlePlay,
                    backgroundColor: const Color(0xFF34A853), // Google's green
                    iconColor: Colors.white,
                    onPressed: () async {
                      const url = 'https://play.google.com/store';
                      final uri = Uri.parse(url);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri,
                            mode: LaunchMode.externalApplication);
                      }
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
