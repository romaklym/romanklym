import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klymroman/widgets/square_step_counter.dart';

class RoadmapDialog extends StatelessWidget {
  final double widthFactor;
  final double heightFactor;
  final double padding;
  final double fontSize;
  final double iconSize;
  final double titleBarHeight;
  final double circleAvatarRadius;
  final double squareStepWidth;
  final double squareStepHeight;

  const RoadmapDialog({
    super.key,
    this.widthFactor = 0.75,
    this.heightFactor = 0.6,
    this.padding = 16.0,
    this.fontSize = 16.0,
    this.iconSize = 22.0,
    this.titleBarHeight = 40.0,
    this.circleAvatarRadius = 24.0,
    this.squareStepWidth = 150.0,
    this.squareStepHeight = 150.0,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * widthFactor;
    final height = MediaQuery.of(context).size.height * heightFactor;

    final List<Map<String, dynamic>> phases = [
      {
        'title': 'Phase 1',
        'dateRange': 'Feb 2025 - May 2025',
        'description':
            'Tokenomics finalization, token development, launch campaigns.',
        'icon': FontAwesomeIcons.rocket,
        'color': const Color(0xFF78BEA2),
      },
      {
        'title': 'Phase 2',
        'dateRange': 'May 2025',
        'description': 'Beta launch in the US with basic features.',
        'icon': FontAwesomeIcons.chartLine,
        'color': const Color(0xFFF98878),
      },
      {
        'title': 'Phase 3',
        'dateRange': 'June - Nov 2025',
        'description': 'Global expansion, multi-platform support, new cities.',
        'icon': FontAwesomeIcons.globe,
        'color': const Color(0xFFF4CECB),
      },
      {
        'title': 'Phase 4',
        'dateRange': 'Dec 2025 - 2026',
        'description':
            'Advanced features like trading, staking, and tournaments.',
        'icon': FontAwesomeIcons.trophy,
        'color': const Color(0xFFEAB436),
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
                            "Roadmap",
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
                          // Explanation Text
                          SquareStepContainer(
                            title: "Roadmap",
                            description:
                                "Explore the roadmap of Touch Grass, outlining the key phases and milestones in our journey towards a robust gaming and blockchain ecosystem.",
                            icon: FontAwesomeIcons.route,
                            width: width - 2 * padding,
                            height: 125,
                          ),
                          const SizedBox(height: 16),
                          // Roadmap Timeline
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            alignment: WrapAlignment.center,
                            children: List.generate(phases.length, (index) {
                              final phase = phases[index];
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    radius: circleAvatarRadius,
                                    backgroundColor: phase['color'],
                                    child: FaIcon(
                                      phase['icon'],
                                      color: Colors.white70,
                                      size: fontSize,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  SquareStepContainer(
                                    title: phase['title'],
                                    description:
                                        "${phase['dateRange']}\n${phase['description']}",
                                    width: squareStepWidth,
                                    height: squareStepHeight,
                                    icon: null,
                                  ),
                                ],
                              );
                            }),
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
