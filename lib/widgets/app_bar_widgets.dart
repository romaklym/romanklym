import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AppBarWidgets extends StatelessWidget {
  const AppBarWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: FaIcon(
            FontAwesomeIcons.linkedin,
            color: const Color(0xFFFFC978),
            size: 16.0,
          ),
          onPressed: () async {
            // Navigate to the Bluesky URL
            const url = 'https://bsky.app/profile/roman.bsky.social';
            final uri = Uri.parse(url);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            }
          },
        ),
        IconButton(
          icon: FaIcon(
            FontAwesomeIcons.github,
            color: const Color(0xFFFFC978),
            size: 16.0,
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: const Color(0xFFF4CECB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Colors.black54, width: 2),
                ),
                content: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const Text(
                    "We are working on releasing our Twitter account to the public. Stay tuned!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Audiowide",
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        IconButton(
          icon: FaIcon(
            FontAwesomeIcons.telegram,
            color: const Color(0xFFFFC978),
            size: 16.0,
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: const Color(0xFFF4CECB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Colors.black54, width: 2),
                ),
                content: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const Text(
                    "We are working on releasing our Telegram account to the public. Stay tuned!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Audiowide",
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        IconButton(
          icon: FaIcon(
            FontAwesomeIcons.discord,
            color: const Color(0xFFFFC978),
            size: 16.0,
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: const Color(0xFFF4CECB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Colors.black54, width: 2),
                ),
                content: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const Text(
                    "We are working on releasing our Discord server to the public. Stay tuned!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Audiowide",
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
