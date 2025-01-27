import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klymroman/resusable_widgets/copy_text_widget.dart';

class WelcomeDesktopWindow extends StatefulWidget {
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
  final Map<String, bool> windowVisibility;
  const WelcomeDesktopWindow({
    super.key,
    this.width = 600,
    this.height = 300,
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
  });

  @override
  State<WelcomeDesktopWindow> createState() => _WelcomeDesktopWindowState();
}

class _WelcomeDesktopWindowState extends State<WelcomeDesktopWindow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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
    return Material(
      color: Colors.transparent,
      child: Container(
        width: widget.width,
        height: widget.height,
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
                        "Welcome",
                        style: TextStyle(
                          fontFamily: "Audiowide",
                          fontSize: widget.fontSizeBanner,
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
                      onPressed: widget.onToggleWelcomeWindow,
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Gradient Animation Text
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: GradientAnimationText(
                            text: Text(
                              "Hi, I'm Roman",
                              style: TextStyle(
                                fontFamily: "Audiowide",
                                fontSize: widget.gradientFontSize,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            duration: const Duration(
                                seconds: 4), // Animation duration
                            colors: const [
                              Colors.greenAccent,
                              Colors.lightBlueAccent,
                              Colors.purpleAccent,
                              Colors.pinkAccent,
                              Colors.yellowAccent,
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(bottom: 16.0),
                        //   child: Text(
                        //     "Nacho Apps is the first game studio on Solana, creating innovative play-to-earn mobile games powered by blockchain technology. Our mission is to build a thriving ecosystem of games where players can explore, compete, and earn real value. Join us in shaping the future of gaming!",
                        //     style: TextStyle(
                        //       fontFamily: "Audiowide",
                        //       color: Color(0xFF704214),
                        //       fontSize: widget.bannerStudioFontSize,
                        //     ),
                        //     textAlign: TextAlign.center,
                        //   ),
                        // ),

                        // Address Copy Container
                        CopyTextWidget(
                          copyText: "klymroman@protonmail.com",
                          address: "klymroman@protonmail.com",
                          padding: widget.paddingCopyText,
                          addressFontSize: widget.fontSizeCopyText,
                          contWidth: widget.contCopyTextWidth,
                          addressIconSize: widget.iconSizeCopyText,
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
