import 'package:flutter/material.dart';
import 'package:klymroman/desktop_view/footer.dart';
import 'package:klymroman/models/widget_position_model.dart';
import 'package:klymroman/pages/mobile_app_window.dart';
import 'package:klymroman/pages/welcome_desktop_window.dart';
import 'package:klymroman/resusable_widgets/draggable_widget.dart';
import 'package:klymroman/theme/app_theme.dart';
import 'package:klymroman/desktop_view/dock_station.dart';
import 'package:klymroman/resusable_widgets/ticker_tape.dart';
import 'package:klymroman/widgets/sticky_note.dart';

class MyDesktopBody extends StatefulWidget {
  const MyDesktopBody({super.key});

  @override
  State<MyDesktopBody> createState() => _MyDesktopBodyState();
}

class _MyDesktopBodyState extends State<MyDesktopBody> {
  bool isDesktopWindowVisible = false;

  Map<String, bool> windowVisibility = {
    'desktopWindow': false,
    'stickyNote': false,
    'welcomeWindow': true,
    'countdownWindow': true,
  };

  Map<String, WidgetPosition> widgetPositions = {};
  late List<String> renderOrder = [];
  bool _hasMovedWelcomeWindow = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenWidth = MediaQuery.of(context).size.width;
      final welcomeWindowWidth = 600.0;

      setState(() {
        widgetPositions = {
          'desktopWindow': WidgetPosition(left: 30, bottom: 80),
          'welcomeWindow': WidgetPosition(
            left: (screenWidth - welcomeWindowWidth) / 2,
            top: 150,
          ),
          'stickyNote': WidgetPosition(right: 10, bottom: 10),
          'countdownWindow': WidgetPosition(right: 20, top: 100),
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

    final welcomeWindowWidth = 600.0; // Widget's width
    if (!_hasMovedWelcomeWindow) {
      widgetPositions['welcomeWindow'] = WidgetPosition(
        left: (screenWidth - welcomeWindowWidth) / 2,
        top: 150,
      );
    }
    return Container(
      color: const Color(0xFF393431),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF393431),
            border: Border.all(
              color: const Color(0xFF704214).withValues(alpha: .8),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Scaffold(
              appBar: null,
              body: Stack(
                children: [
                  // Background Image on top of CustomPainter
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/1.png',
                      fit: BoxFit
                          .cover, // Ensures the image covers the entire screen
                    ),
                  ),

                  CustomPaint(
                    painter: _RetroGridPainter(),
                    child:
                        Container(), // Ensures the grid fills the available space
                  ),

                  Positioned(
                    top: 0, // Place at the top of the screen
                    left: 0,
                    right: 0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                          child: TickerTape(
                            text: "Hi, I'm Roman! Nice to meet you! ",
                            style: AppTextStyles.tickerTape,
                            velocity: 40, // Adjust speed as needed
                          ),
                        ),
                      ],
                    ),
                  ),

                  DockStation(),

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
              bottomNavigationBar: Footer(
                onToggleDesktopWindow: () => _toggleWindow('desktopWindow'),
                onToggleWelcomeWindow: () => _toggleWindow('welcomeWindow'),
                onToggleCountdownWindow: () => _toggleWindow('countdownWindow'),
                onToggleStickyNote: () => _toggleWindow('stickyNote'),
                windowVisibility: windowVisibility,
              ),
            ),
          ),
        ),
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
          width: 620,
          height: 430,
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
          height: 400,
          onToggleWelcomeWindow: () => _toggleWindow('welcomeWindow'),
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
