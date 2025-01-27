import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klymroman/widgets/square_step_counter.dart';

class TermsOfUseDialog extends StatelessWidget {
  final double widthSize;
  final double heightSize;
  const TermsOfUseDialog({
    super.key,
    this.widthSize = 0.75,
    this.heightSize = 0.85,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * widthSize; // Dialog width
    final height =
        MediaQuery.of(context).size.height * heightSize; // Dialog height

    final List<Map<String, dynamic>> termsPoints = [
      {
        'title': "Purpose of the App",
        'description':
            "Touch Grass is a gaming platform designed for entertainment purposes only. No guarantees are made regarding game outcomes, rewards, or performance.",
        'icon': FontAwesomeIcons.gamepad,
        'color': const Color(0xFF78BEA2),
      },
      {
        'title': "User Conduct",
        'description':
            "Users must not use the app to engage in illegal or harmful activities. Misuse of the app, including tampering, is prohibited.",
        'icon': FontAwesomeIcons.userShield,
        'color': const Color(0xFFF98878),
      },
      {
        'title': "Disclaimer of Liability",
        'description':
            "Touch Grass is provided 'as is.' We make no guarantees regarding performance, availability, or compatibility. We are not liable for damages.",
        'icon': FontAwesomeIcons.exclamation,
        'color': const Color(0xFFF4CECB),
      },
      {
        'title': "Ownership of Content",
        'description':
            "All content, graphics, and assets within the app are owned by Touch Grass, LLC. Users may not reproduce or modify content without permission.",
        'icon': FontAwesomeIcons.ruler,
        'color': const Color(0xFFEAB436),
      },
      {
        'title': "Updates and Changes",
        'description':
            "We reserve the right to update or modify these terms. Continued use of the app constitutes acceptance of revised terms.",
        'icon': FontAwesomeIcons.rotate,
        'color': const Color(0xFF1F8DC2),
      },
      {
        'title': "Third-Party Links",
        'description':
            "The app may include links to third-party websites. We are not responsible for their content, policies, or practices.",
        'icon': FontAwesomeIcons.link,
        'color': const Color(0xFF522909),
      },
      {
        'title': "No Data Collection",
        'description':
            "Touch Grass does not collect or store personal data. The app operates locally on your device.",
        'icon': FontAwesomeIcons.lock,
        'color': const Color(0xFF78BEA2),
      },
    ];

    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.transparent, // Transparent to show background image
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: const Color(0xFF704214), // Retro brown color
            width: 2.0,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF704214), // Shadow color
              offset: const Offset(-5, 5),
              blurRadius: 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Stack(
            children: [
              // Background Image
              Positioned.fill(
                child: Image.asset(
                  'assets/images/3.png',
                  fit: BoxFit.cover, // Cover entire container
                ),
              ),
              // Transparent Grid Overlay
              Positioned.fill(
                child: CustomPaint(
                  painter: _RetroGridPainter(),
                ),
              ),
              Column(
                children: [
                  // Title Bar
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFC978), // Retro yellow-orange
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(4),
                      ),
                      border: const Border(
                        bottom: BorderSide(
                          color: Color(0xFF704214), // Retro brown border
                          width: 2,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            "Terms of Use",
                            style: const TextStyle(
                              fontFamily: "Audiowide",
                              fontSize: 16,
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
                          onPressed: () => Navigator.of(context).pop(),
                          iconSize: 20.0,
                        ),
                        IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.squareXmark,
                            color: Colors.redAccent,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          iconSize: 20.0,
                        ),
                      ],
                    ),
                  ),
                  // Terms of Use Content
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SquareStepContainer(
                                  title: "Our Terms of Use",
                                  description: "",
                                  icon: FontAwesomeIcons.fileShield,
                                  width: 250,
                                  height: 100),
                            ],
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 20,
                            runSpacing: 12,
                            children: termsPoints.map((point) {
                              return SquareStepContainer(
                                title: point['title'],
                                description: point['description'],
                                icon: point['icon'],
                                width: 200,
                                height: 225,
                                iconColor: point['color'],
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "By continuing to use the app, you agree to these Terms of Use.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Audiowide",
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RetroGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withValues(alpha: 0.1)
      ..strokeWidth = 0.5;

    const gridSpacing = 15.0;

    for (double x = 0; x <= size.width; x += gridSpacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y <= size.height; y += gridSpacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
