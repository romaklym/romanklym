import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klymroman/resusable_widgets/custom_button.dart';
import 'package:klymroman/resusable_widgets/clock_widget.dart';
import 'package:klymroman/widgets/start_button.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterMobile extends StatelessWidget {
  final VoidCallback onToggleDesktopWindow;
  final VoidCallback onToggleWelcomeWindow;
  final VoidCallback onToggleStickyNote;
  final Map<String, bool> windowVisibility; // Add windowVisibility parameter

  const FooterMobile({
    super.key,
    required this.onToggleDesktopWindow,
    required this.onToggleWelcomeWindow,
    required this.onToggleStickyNote,
    required this.windowVisibility, // Initialize windowVisibility
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xFFF3989F),
        border: Border(
          top: BorderSide(
            color: Color(0xFF704214), // Brown border color
            width: 3.0, // Border width
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Start Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: StartButton(
              iconSize: 14.0,
              fontSize: 12.0,
              sizedBoxSize: 4.0,
              onTap: () async {
                const url =
                    "https://raydium.io/swap/?inputMint=2zMMhcVQEXDtdE6vsFS7S7D5oUodfJHE8vd1gnBouauv&outputMint=sol";
                if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url),
                      mode: LaunchMode.externalApplication);
                }
              },
            ),
          ),

          // Row of all other buttons
          Row(
            children: [
              CustomButton(
                icon: FontAwesomeIcons.mobile,
                onTap: onToggleDesktopWindow,
                windowKey: 'desktopWindow', // Pass key
                windowVisibility: windowVisibility,
                activeColor: const Color(0xFFA5A5A5),
                inactiveColor: const Color(0xFFF5D9AF),
                fontSize: 8.0,
              ),
              const SizedBox(width: 4),
              CustomButton(
                icon: FontAwesomeIcons.folderOpen,
                onTap: onToggleWelcomeWindow,
                windowKey: 'welcomeWindow', // Pass key
                windowVisibility: windowVisibility, // Pass visibility map
                activeColor: const Color(0xFFA5A5A5),
                inactiveColor: const Color(0xFFF5D9AF),
                fontSize: 8.0,
              ),
              const SizedBox(width: 4),
              CustomButton(
                icon: FontAwesomeIcons.noteSticky,
                onTap: onToggleStickyNote,
                windowKey: 'stickyNote', // Pass key
                windowVisibility: windowVisibility,
                activeColor: const Color(0xFFA5A5A5),
                inactiveColor: const Color(0xFFFCFFC1),
                fontSize: 8.0,
              ),
            ],
          ),
          Spacer(),
          // Clock Widget
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                const ClockWidget(fontSize: 10.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
