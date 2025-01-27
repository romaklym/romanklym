import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klymroman/resusable_widgets/copy_text_widget.dart';
import 'package:klymroman/widgets/square_step_counter.dart';

class CareersDialog extends StatelessWidget {
  final double widthSize;
  final double heightSize;
  const CareersDialog({
    super.key,
    this.widthSize = 0.85,
    this.heightSize = 0.85,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * widthSize; // Dialog width
    final height =
        MediaQuery.of(context).size.height * heightSize; // Dialog height

    final List<Map<String, dynamic>> careerRoles = [
      {
        'title': "UI/UX Designers",
        'description':
            "Design intuitive and engaging user experiences for our gaming ecosystem.",
        'icon': FontAwesomeIcons.drawPolygon,
        'color': const Color(0xFF78BEA2),
      },
      {
        'title': "Game Designers",
        'description':
            "Craft innovative game mechanics and immersive storytelling elements.",
        'icon': FontAwesomeIcons.gamepad,
        'color': const Color(0xFFF98878),
      },
      {
        'title': "Solana Labs Developers",
        'description':
            "Develop smart contracts and blockchain solutions for the Touch Grass ecosystem.",
        'icon': FontAwesomeIcons.code,
        'color': const Color(0xFFF4CECB),
      },
      {
        'title': "Discord Moderators",
        'description':
            "Manage and foster our vibrant gaming community on Discord.",
        'icon': FontAwesomeIcons.discord,
        'color': const Color(0xFFEAB436),
      },
      {
        'title': "Social Media Managers",
        'description':
            "Create and manage campaigns to engage with our global audience.",
        'icon': FontAwesomeIcons.twitter,
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
                            "Careers",
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
                  // Careers Content
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SquareStepContainer(
                                  title:
                                      "We are excited to announce that job positions will be opening in March-April 2025.",
                                  description: "",
                                  icon: FontAwesomeIcons.bullhorn,
                                  width: 290,
                                  height: 145),
                            ],
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          // Display Career Roles
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 20,
                            runSpacing: 12,
                            children: careerRoles.map((role) {
                              return SquareStepContainer(
                                title: role['title'],
                                description: role['description'],
                                icon: role['icon'],
                                width: 200,
                                height: 180,
                                iconColor: role['color'],
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 20),
                          // Email Section
                          const Text(
                            "If you’re passionate about building cutting-edge gaming experiences, send your CV to:",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Audiowide",
                              fontSize: 14,
                              color: Colors.black54,
                              height: 1.8,
                            ),
                          ),
                          const SizedBox(height: 12),
                          CopyTextWidget(
                            copyText: "careers@getklymroman.com",
                            address: "careers@getklymroman.com",
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
