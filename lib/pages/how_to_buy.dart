import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klymroman/widgets/step_container.dart';

class HowToBuyDialog extends StatelessWidget {
  final double widthFactor;
  final double heightFactor;
  final double fontSize;
  final double titleBarHeight;
  final double padding;
  final double iconSize;

  const HowToBuyDialog({
    super.key,
    this.widthFactor = 0.6, // Default width factor
    this.heightFactor = 0.8, // Default height factor
    this.fontSize = 16.0, // Default font size
    this.titleBarHeight = 40.0, // Default title bar height
    this.padding = 8.0,
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
                            "How to Buy \$NACHO",
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
                        children: const [
                          StepContainer(
                            title: "Step 1: Open Raydium",
                            description:
                                "Click on the Raydium button in the dock to open the Raydium interface.",
                            icon: Icons.wallet,
                            customColor: Color(0xFF8CCBB4),
                          ),
                          StepContainer(
                            title: "Step 2: Connect Your Wallet",
                            description:
                                "Use the Connect Wallet button to connect your Phantom Wallet.",
                            icon: Icons.link,
                            customColor: Color(0xFFFC946A),
                          ),
                          StepContainer(
                            title: "Step 3: Fund Your Wallet",
                            description:
                                "Ensure your wallet is funded with SOL. You can add funds using any major exchange.",
                            icon: Icons.account_balance_wallet,
                            customColor: Color(0xFF5E5273),
                          ),
                          StepContainer(
                            title: "Step 4: Swap for \$NACHO",
                            description:
                                "In the Raydium interface, swap SOL for \$NACHO. Approve the transaction in your wallet.",
                            icon: Icons.swap_horiz,
                            customColor: Color(0xFFDCADBC),
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
