import 'package:flutter/material.dart';
import 'package:klymroman/mobile_view/app_drawer.dart';
import 'package:klymroman/mobile_view/dock_station_mobile.dart';
import 'package:klymroman/mobile_view/drawer_button.dart';
import 'package:klymroman/mobile_view/footer_mobile.dart';
import 'package:klymroman/models/widget_position_model.dart';
import 'package:klymroman/pages/mobile_app_window.dart';
import 'package:klymroman/pages/welcome_desktop_window.dart';
import 'package:klymroman/resusable_widgets/draggable_widget.dart';
import 'package:klymroman/theme/app_theme.dart';
import 'package:klymroman/widgets/countdown_timer.dart';
import 'package:klymroman/resusable_widgets/marquee_banner.dart';
import 'package:klymroman/widgets/solana_price_tracker.dart';
import 'package:klymroman/widgets/sticky_note.dart';

class MyMobileBody extends StatefulWidget {
  const MyMobileBody({super.key});

  @override
  State<MyMobileBody> createState() => _MyMobileBodyState();
}

class _MyMobileBodyState extends State<MyMobileBody> {
  bool isDesktopWindowVisible = false;

  Map<String, bool> windowVisibility = {
    'desktopWindow': false,
    'stickyNote': false,
    'welcomeWindow': true,
    'countdownWindow': false,
  };

  Map<String, WidgetPosition> widgetPositions = {};
  late List<String> renderOrder = [];
  bool _hasMovedWelcomeWindow = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenWidth = MediaQuery.of(context).size.width;
      final welcomeWindowWidth = 370.0;

      setState(() {
        widgetPositions = {
          'desktopWindow': WidgetPosition(left: 30, bottom: 80),
          'welcomeWindow': WidgetPosition(
            left: (screenWidth - welcomeWindowWidth) / 2,
            top: 150,
          ),
          'stickyNote': WidgetPosition(right: 10, bottom: 65),
          'countdownWindow': WidgetPosition(right: 10, top: 100),
        };

        // Initial render order
        renderOrder = [
          'stickyNote',
          'desktopWindow',
          'welcomeWindow',
          'countdownWindow'
        ];
      });
    });
  }

  void _toggleWindow(String windowKey) {
    setState(() {
      windowVisibility[windowKey] = !(windowVisibility[windowKey] ?? false);
    });
  }

  void _moveToBottom(String key) {
    setState(() {
      renderOrder.remove(key);
      renderOrder.add(key);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final welcomeWindowWidth = 370.0; // Widget's width
    if (!_hasMovedWelcomeWindow) {
      widgetPositions['welcomeWindow'] = WidgetPosition(
        left: (screenWidth - welcomeWindowWidth) / 2,
        top: 150,
      );
    }

    return Scaffold(
      appBar: null,
      endDrawer: AppDrawer(),
      body: Stack(
        children: [
          // Background Image on top of CustomPainter
          Positioned.fill(
            child: Image.asset(
              'assets/images/1.png',
              fit: BoxFit.cover, // Ensures the image covers the entire screen
            ),
          ),
          CustomPaint(
            painter: _RetroGridPainter(),
            child: Container(), // Ensures the grid fills the available space
          ),

          Positioned(
            top: 0, // Place at the top of the screen
            left: 0,
            right: 0,
            child: Column(
              children: [
                // Marquee Text
                Container(
                  width: double.infinity,
                  height: 35,
                  decoration: const BoxDecoration(
                    color: Color(0xFF243642),
                    border: Border(
                      bottom: BorderSide(
                        width: 3,
                        color: Color(0xFF704214),
                      ),
                    ),
                  ),
                  child: MarqueeText(
                    text:
                        "\$NACHO ▲ PRICE: \$0.0000026 ▼ VOL: \$6.5M ▲ MKT CAP: \$126.65M ",
                    style: AppTextStyles.tickerTape,
                    velocity: 40, // Adjust speed as needed
                  ),
                ),
                // AppBar Widgets (if needed)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SolanaPriceWidget(),
                      Text(
                        "Roman Klym",
                        style: const TextStyle(
                          fontFamily: "Nabla",
                          fontWeight: FontWeight.w900,
                          fontSize: 32,
                        ),
                      ),
                      Builder(
                        builder: (context) => CustomDrawerButton(
                          onTap: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          DockStationMobile(
            width: 50.0, // Custom width
            height: 50.0, // Custom height
            svgWidth: 20.0, // Custom SVG width
            svgHeight: 20.0, // Custom SVG height
            fontSize: 8.0, // Custom font size
            iconSize: 20.0,
          ),

          ...renderOrder.map((key) {
            if (windowVisibility[key] ?? false) {
              return DraggableWidget(
                keyName: key,
                onDragStart: () {
                  _moveToBottom(key);
                  if (key == 'welcomeWindow') {
                    setState(() {
                      _hasMovedWelcomeWindow = true;
                    });
                  }
                },
                widgetPositions: widgetPositions,
                onPositionUpdate: (updatedKey, updatedPosition) {
                  setState(() {
                    widgetPositions[updatedKey] = updatedPosition;
                  });
                },
                child: _getWidgetByKey(key),
              );
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
      bottomNavigationBar: FooterMobile(
        onToggleDesktopWindow: () => _toggleWindow('desktopWindow'),
        onToggleWelcomeWindow: () => _toggleWindow('welcomeWindow'),
        onToggleCountdownWindow: () => _toggleWindow('countdownWindow'),
        onToggleStickyNote: () => _toggleWindow('stickyNote'),
        windowVisibility: windowVisibility,
      ),
    );
  }

  Widget _getWidgetByKey(String key) {
    switch (key) {
      case 'stickyNote':
        return StickyNoteWidget();
      case 'desktopWindow':
        return DesktopWindow(
          title: "Mobile App",
          width: 300,
          height: 200,
          containerHeight: 40.0,
          iconSize: 20.0,
          fontSize: 12.0,
          padding: 8.0,
          isButtons: true,
          content: Image.asset(
            'assets/images/mockup.png',
            fit: BoxFit.cover,
          ),
          onToggleDesktopWindow: () => _toggleWindow('desktopWindow'),
          windowVisibility: windowVisibility,
        );
      case 'welcomeWindow':
        return WelcomeDesktopWindow(
          width: 370,
          height: 300,
          contHeight: 40,
          fontSizeBanner: 12.0,
          iconSizeBanner: 20.0,
          fontSizeCopyText: 8.0,
          contCopyTextWidth: 310,
          gradientFontSize: 22.0,
          paddingCopyText: 4.0,
          bannerStudioFontSize: 10.0,
          bannerPaddingLeft: 8.0,
          addressIconSize: 12.0,
          loaderHeightWidth: 14.0,
          addressFontSize: 10.0,
          padding: 4.0,
          onToggleWelcomeWindow: () => _toggleWindow('welcomeWindow'),
          windowVisibility: windowVisibility,
        );
      case 'countdownWindow':
        return CountdownTimerWindow(
          width: 200,
          height: 100,
          contHeight: 40,
          fontSizeBanner: 12.0,
          iconSizeBanner: 20.0,
          gradientFontSize: 20.0,
          bannerPaddingLeft: 8.0,
          countdownFontSize: 14.0,
          padding: 4.0,
          onToggleCountdownWindow: () => _toggleWindow('countdownWindow'),
          windowVisibility: windowVisibility,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

class _RetroGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black12
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
