import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:klymroman/widgets/square_step_counter.dart';

class TokenomicsDialog extends StatelessWidget {
  final double widthFactor;
  final double heightFactor;
  final double fontSize;
  final double titleBarHeight;
  final double padding;
  final double spacing;
  final double runSpacing;
  final double chartRadius;
  final double chartCenterSpaceRadius;
  final double tokenFontSize;
  final double tokenDescriptionFontSize;
  final double tokenIconSize;
  final double paddingTitleBar;
  final double iconSize;

  const TokenomicsDialog(
      {super.key,
      this.widthFactor = 0.75, // Default width factor
      this.heightFactor = 0.8, // Default height factor
      this.fontSize = 16.0, // Default font size
      this.titleBarHeight = 40.0, // Default title bar height
      this.padding = 16.0, // Default content padding
      this.paddingTitleBar = 16.0,
      this.iconSize = 22.0,
      this.spacing = 20.0, // Default horizontal spacing
      this.runSpacing = 12.0, // Default vertical spacing
      this.chartRadius = 50.0, // Default pie chart section radius
      this.chartCenterSpaceRadius = 60.0, // Default chart center space radius
      this.tokenFontSize = 14.0,
      this.tokenDescriptionFontSize = 12.0,
      this.tokenIconSize = 24.0});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * widthFactor;
    final height = MediaQuery.of(context).size.height * heightFactor;

    final List<PieChartSectionData> chartSections = [
      PieChartSectionData(
        value: 40,
        color: const Color(0xFF78BEA2),
        radius: chartRadius,
        title: "40%",
        titleStyle: TextStyle(
          fontFamily: "Audiowide",
          fontSize: fontSize * 0.75,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        value: 25,
        color: const Color(0xFFF98878),
        radius: chartRadius,
        title: "25%",
        titleStyle: TextStyle(
          fontFamily: "Audiowide",
          fontSize: fontSize * 0.75,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        value: 15,
        color: const Color(0xFFF4CECB),
        radius: chartRadius,
        title: "15%",
        titleStyle: TextStyle(
          fontFamily: "Audiowide",
          fontSize: fontSize * 0.75,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        value: 10,
        color: const Color(0xFFEAB436),
        radius: chartRadius,
        title: "10%",
        titleStyle: TextStyle(
          fontFamily: "Audiowide",
          fontSize: fontSize * 0.75,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        value: 7,
        color: const Color(0xFF1F8DC2),
        radius: chartRadius,
        title: "7%",
        titleStyle: TextStyle(
          fontFamily: "Audiowide",
          fontSize: fontSize * 0.75,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        value: 3,
        color: const Color(0xFF522909),
        radius: chartRadius,
        title: "3%",
        titleStyle: TextStyle(
          fontFamily: "Audiowide",
          fontSize: fontSize * 0.75,
          color: Colors.white,
        ),
      ),
    ];

    final List<String> categories = [
      "Game Rewards Bank",
      "Initial Liquidity",
      "Liquidity Provision",
      "Team Allocation",
      "Development",
      "Marketing"
    ];

    final List<String> explanations = [
      "For rewarding players through missions, leaderboards, check-ins, and events. Tokens will be distributed gradually over time to ensure longevity. (Locked)",
      "Allocated for providing initial liquidity and ensuring smooth trading post-launch.",
      "Reserved specifically for future DEX listings and supporting token trading activity. (Locked)",
      "Locked for a 1-year cliff, followed by a 3-year vesting schedule, ensuring team commitment. (Locked)",
      "To fund app updates, partnerships, and ecosystem growth.",
      "Promotes the game and token through influencer campaigns, advertising, and community events.",
    ];

    final List<IconData> icons = [
      FontAwesomeIcons.piggyBank,
      FontAwesomeIcons.moneyBillTransfer,
      FontAwesomeIcons.peopleGroup,
      FontAwesomeIcons.tv,
      FontAwesomeIcons.hammer,
      FontAwesomeIcons.vault,
    ];

    final List<Color> colors = [
      const Color(0xFF78BEA2),
      const Color(0xFFF98878),
      const Color(0xFFF4CECB),
      const Color(0xFFEAB436),
      const Color(0xFF1F8DC2),
      const Color(0xFF522909),
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
              Positioned.fill(
                child: Image.asset(
                  'assets/images/3.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: CustomPaint(
                  painter: _RetroGridPainter(),
                ),
              ),
              Column(
                children: [
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
                          padding: EdgeInsets.only(left: paddingTitleBar),
                          child: Text(
                            "Tokenomics",
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
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(padding),
                      child: Column(
                        children: [
                          Row(),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: spacing,
                            runSpacing: runSpacing,
                            children: [
                              SquareStepContainer(
                                title: "Total Token Supply",
                                description: "100,000,000,000",
                                icon: FontAwesomeIcons.coins,
                                width: 200,
                                height: 100,
                              ),
                              SizedBox(
                                width: 250,
                                height: 250,
                                child: PieChart(
                                  PieChartData(
                                    sections: chartSections,
                                    centerSpaceRadius: chartCenterSpaceRadius,
                                    borderData: FlBorderData(show: false),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: spacing,
                            runSpacing: runSpacing,
                            children: List.generate(categories.length, (index) {
                              return SquareStepContainer(
                                title: categories[index],
                                description: explanations[index],
                                icon: icons[index],
                                iconColor: colors[index],
                                width: 200,
                                height: 225,
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
