import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klymroman/widgets/square_step_counter.dart';

class GameDialog extends StatelessWidget {
  final double widthFactor;
  final double heightFactor;
  final double fontSize;
  final double titleBarHeight;
  final double padding;
  final double spacing;
  final double runSpacing;
  final double iconSize;

  const GameDialog({
    super.key,
    this.widthFactor = 0.55, // Default width factor
    this.heightFactor = 0.8, // Default height factor
    this.fontSize = 16.0, // Default font size
    this.titleBarHeight = 40.0, // Default title bar height
    this.padding = 16.0, // Default padding for content
    this.spacing = 16.0, // Default horizontal spacing
    this.runSpacing = 16.0, // Default vertical spacing
    this.iconSize = 22.0,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * widthFactor;
    final height = MediaQuery.of(context).size.height * heightFactor;

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
                  painter: _RetroGridPainter(), // Paint the grid
                ),
              ),
              Column(
                children: [
                  // Title Bar
                  Container(
                    height: titleBarHeight,
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
                            "Games",
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [],
                          ),
                          Wrap(
                            spacing:
                                spacing, // Space between containers horizontally
                            runSpacing:
                                runSpacing, // Space between containers vertically
                            children: const [
                              SquareStepContainer(
                                title: "Explore, Compete, Earn",
                                description:
                                    "Touch Grass is a unique mobile app that turns the real world into your playground. Using real-world maps, players explore actual locations to complete quests, compete for rewards, and build their virtual empire.",
                                icon: Icons.map,
                                width: 200,
                                height: 265,
                                iconColor: Color(0xFF8CCBB4),
                              ),
                              SquareStepContainer(
                                title: "Explore Locations",
                                description:
                                    "Visit landmarks and hotspots to complete quests and earn \$GRASS tokens.",
                                icon: Icons.place,
                                width: 200,
                                height: 200,
                                iconColor: Color(0xFFFC946A),
                              ),
                              SquareStepContainer(
                                title: "Virtual Visits",
                                description:
                                    "Use in-game items like diamonds and energy to virtually visit faraway locations and continue earning.",
                                icon: Icons.airplanemode_active,
                                width: 200,
                                height: 180,
                                iconColor: Color(0xFF5E5273),
                              ),
                              SquareStepContainer(
                                title: "Compete and Win",
                                description:
                                    "Climb daily, weekly, and monthly leaderboards to win big rewards and showcase your dominance.",
                                icon: Icons.leaderboard,
                                width: 200,
                                height: 180,
                                iconColor: Color(0xFFDCADBC),
                              ),
                              SquareStepContainer(
                                title: "Build Your Empire",
                                description:
                                    "Purchase in-game real estate, set up checkpoints for passive income, and customize your character with exclusive skins and items.",
                                icon: Icons.build,
                                width: 200,
                                height: 200,
                                iconColor: Color(0xFF74B8CE),
                              ),
                              SquareStepContainer(
                                title: "Launch Timeline",
                                description:
                                    "Beta (U.S.): May 2025\nGlobal Launch: November 2025",
                                icon: Icons.calendar_today,
                                width: 200,
                                height: 150,
                                iconColor: Color(0xFFE3912E),
                              ),
                            ],
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

// RetroGridPainter for transparent grid overlay
class _RetroGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withAlpha(25)
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
