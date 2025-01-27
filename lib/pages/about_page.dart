import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klymroman/widgets/square_step_counter.dart';

class AboutUsDialog extends StatelessWidget {
  final double widthFactor;
  final double heightFactor;
  final double padding;
  final double spacing;
  final double runSpacing;
  final double fontSize;
  final double iconSize;
  final double containerWidth;
  final double containerHeight;
  final double titleBarHeight;

  const AboutUsDialog({
    super.key,
    this.widthFactor = 0.75,
    this.heightFactor = 0.8,
    this.padding = 16.0,
    this.spacing = 20.0,
    this.runSpacing = 12.0,
    this.fontSize = 16.0,
    this.iconSize = 20.0,
    this.containerWidth = 200.0,
    this.containerHeight = 225.0,
    this.titleBarHeight = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * widthFactor;
    final height = MediaQuery.of(context).size.height * heightFactor;

    final List<Map<String, dynamic>> aboutPoints = [
      {
        'title': "Our Passion",
        'description':
            "We are passionate about creating engaging and innovative gaming experiences that bridge the gap between the digital and real world.",
        'icon': FontAwesomeIcons.heart,
      },
      {
        'title': "Our Team",
        'description':
            "Composed of talented developers, designers, and visionaries with extensive experience in the gaming industry.",
        'icon': FontAwesomeIcons.peopleGroup,
      },
      {
        'title': "Who are we?",
        'description':
            "We’ve contributed to AAA console and desktop games for Ubisoft, mobile innovations with Playrix, and casual mobile hits with PeopleFun.",
        'icon': FontAwesomeIcons.briefcase,
      },
      {
        'title': "Independence",
        'description':
            "Touch Grass is an independent project and is not affiliated, associated, or endorsed by any of these companies.",
        'icon': FontAwesomeIcons.handshake,
      },
      {
        'title': "Our Mission",
        'description':
            "To build a unique, real-time mobile gaming experience allowing players to explore, compete, and earn in an immersive, token-powered ecosystem.",
        'icon': FontAwesomeIcons.bullseye,
      },
      {
        'title': "Connect Worlds",
        'description':
            "We aim to connect players to both the virtual and physical worlds like never before.",
        'icon': FontAwesomeIcons.globe,
      },
      {
        'title': "Adventure Begins",
        'description':
            "Welcome to Touch Grass, where your adventures are just beginning!",
        'icon': FontAwesomeIcons.map,
      },
    ];

    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: const Color(0xFF704214),
            width: 2.0,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF704214),
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
                  fit: BoxFit.cover,
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
                    height: titleBarHeight,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFC978),
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(4),
                      ),
                      border: const Border(
                        bottom: BorderSide(
                          color: Color(0xFF704214),
                          width: 2,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: padding),
                          child: Text(
                            "About Us",
                            style: TextStyle(
                              fontFamily: "Audiowide",
                              fontSize: fontSize,
                              color: const Color(0xFF704214),
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
                          iconSize: iconSize,
                        ),
                        IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.squareXmark,
                            color: Colors.redAccent,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          iconSize: iconSize,
                        ),
                      ],
                    ),
                  ),
                  // Content Area
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(padding),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SquareStepContainer(
                                title: "About Us",
                                description: "",
                                icon: FontAwesomeIcons.info,
                                width: 200,
                                height: 80,
                              ),
                            ],
                          ),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: spacing,
                            runSpacing: runSpacing,
                            children: aboutPoints.map((point) {
                              return SquareStepContainer(
                                title: point['title'],
                                description: point['description'],
                                icon: point['icon'],
                                width: containerWidth,
                                height: containerHeight,
                                fontSize: fontSize,
                                iconSize: iconSize,
                              );
                            }).toList(),
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
