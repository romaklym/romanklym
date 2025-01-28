import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VokiGames extends StatefulWidget {
  final double width;
  final double height;
  final double contHeight;
  final double fontSizeBanner;
  final double iconSizeBanner;
  final double gradientFontSize;
  final double bannerStudioFontSize;
  final double bannerPaddingLeft;
  final double addressFontSize;
  final double addressIconSize;
  final double padding;
  final double loaderHeightWidth;
  final double contCopyTextWidth;
  final double fontSizeCopyText;
  final double iconSizeCopyText;
  final double paddingCopyText;
  final VoidCallback onToggleWelcomeWindow;
  final Function(double, double)? onPositionChanged;
  final Map<String, bool> windowVisibility;
  const VokiGames({
    super.key,
    this.width = 500,
    this.height = 200,
    this.contHeight = 40,
    this.fontSizeBanner = 16.0,
    this.iconSizeBanner = 22.0,
    this.contCopyTextWidth = 450,
    this.fontSizeCopyText = 12.0,
    this.iconSizeCopyText = 14.0,
    this.gradientFontSize = 32.0,
    this.bannerStudioFontSize = 14.0,
    this.bannerPaddingLeft = 16.0,
    this.addressIconSize = 15.0,
    this.addressFontSize = 14.0,
    this.paddingCopyText = 8.0,
    this.padding = 8.0,
    this.loaderHeightWidth = 20.0,
    required this.onToggleWelcomeWindow,
    required this.windowVisibility,
    this.onPositionChanged,
  });

  @override
  State<VokiGames> createState() => _VokiGamesState();
}

class _VokiGamesState extends State<VokiGames>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Duration of animation
    )..repeat(); // Loop the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: Container(
        width: isFullScreen ? screenSize.width * 0.95 : widget.width,
        height: isFullScreen ? screenSize.height * 0.8 : widget.height,
        decoration: BoxDecoration(
          color: const Color(0xFFFFF5DC), // Retro beige background
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: const Color(0xFF704214), // Retro brown color
            width: 2.0, // Border width
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF704214), // Shadow color
              offset: Offset(-5, 5),
              blurRadius: 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title Bar
              Container(
                height: widget.contHeight,
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
                      padding: EdgeInsets.only(left: widget.bannerPaddingLeft),
                      child: Text(
                        "Voki Games",
                        style: TextStyle(
                          fontFamily: "Audiowide",
                          fontSize: widget.fontSizeBanner,
                          color: Color(0xFF704214),
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: FaIcon(
                        isFullScreen
                            ? FontAwesomeIcons.copy
                            : FontAwesomeIcons.square,
                        color: Color(0xFF704214),
                      ),
                      onPressed: () {
                        setState(() {
                          isFullScreen = !isFullScreen;
                          if (isFullScreen) {
                            widget.onPositionChanged?.call(20, 45);
                          }
                        });
                      },
                      iconSize: widget.iconSizeBanner,
                    ),
                    // Close button
                    IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.squareXmark,
                        color: Colors.redAccent,
                      ),
                      onPressed: widget.onToggleWelcomeWindow,
                      iconSize: widget.iconSizeBanner,
                    ),
                  ],
                ),
              ),

              // Content Area
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: EasyWebView(
                            src: 'https://www.linkedin.com/in/klymroman/',
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
