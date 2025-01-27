import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klymroman/widgets/square_step_counter.dart';

class PrivacyPolicyDialog extends StatelessWidget {
  final double widthSize;
  final double heightSize;
  const PrivacyPolicyDialog({
    super.key,
    this.widthSize = 0.75,
    this.heightSize = 0.65,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * widthSize; // Dialog width
    final height =
        MediaQuery.of(context).size.height * heightSize; // Dialog height

    final List<Map<String, dynamic>> privacyPoints = [
      {
        'title': "No Data Collection",
        'description':
            "We do not collect, store, or process any personal data from users. Your interactions with our app remain entirely private and anonymous.",
        'icon': FontAwesomeIcons.userSecret,
        'color': const Color(0xFF78BEA2),
      },
      {
        'title': "No Accounts or Logins",
        'description':
            "Our application does not require user accounts or logins. There is no need to provide an email address, password, or any other personal information.",
        'icon': FontAwesomeIcons.lock,
        'color': const Color(0xFFF98878),
      },
      {
        'title': "Third-Party Services",
        'description':
            "Touch Grass does not integrate with third-party services that track or collect user data. Any features that link to external websites operate independently.",
        'icon': FontAwesomeIcons.globe,
        'color': const Color(0xFFF4CECB),
      },
      {
        'title': "Local Device Usage",
        'description':
            "All app functionalities operate locally on your device. No data is transmitted to our servers or any external system.",
        'icon': FontAwesomeIcons.mobile,
        'color': const Color(0xFFEAB436),
      },
      {
        'title': "Updates to Privacy Policy",
        'description':
            "While we don’t anticipate changes, any updates to our privacy policy will be communicated clearly within the app.",
        'icon': FontAwesomeIcons.solidBell,
        'color': const Color(0xFF1F8DC2),
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
                            "Privacy Policy",
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
                  // Privacy Policy Content
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SquareStepContainer(
                                  title: "Our Commitment to Your Privacy",
                                  icon: FontAwesomeIcons.shieldHalved,
                                  description: "",
                                  width: 250,
                                  height: 100),
                            ],
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 0,
                            runSpacing: 12,
                            children: privacyPoints.map((point) {
                              return SquareStepContainer(
                                title: point['title'],
                                description: point['description'],
                                icon: point['icon'],
                                width: 200,
                                height: 230,
                                iconColor: point['color'],
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Thank you for trusting Touch Grass.",
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
