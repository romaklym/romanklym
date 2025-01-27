import 'dart:async';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klymroman/theme/app_colors.dart';

class CountdownTimerWindow extends StatefulWidget {
  final double width;
  final double height;
  final double contHeight;
  final double fontSizeBanner;
  final double iconSizeBanner;
  final double gradientFontSize;
  final double bannerPaddingLeft;
  final double countdownFontSize;
  final double padding;
  final VoidCallback onToggleCountdownWindow;
  final Map<String, bool> windowVisibility;
  const CountdownTimerWindow({
    super.key,
    this.width = 280,
    this.height = 125,
    this.contHeight = 40,
    this.fontSizeBanner = 16.0,
    this.iconSizeBanner = 18.0,
    this.gradientFontSize = 32.0,
    this.bannerPaddingLeft = 16.0,
    this.countdownFontSize = 20.0,
    this.padding = 8.0,
    required this.onToggleCountdownWindow,
    required this.windowVisibility,
  });

  @override
  State<CountdownTimerWindow> createState() => _CountdownTimerWindowState();
}

class _CountdownTimerWindowState extends State<CountdownTimerWindow> {
  late Timer _timer;
  Duration _timeRemaining = Duration.zero;

  @override
  void initState() {
    super.initState();
    _initializeTimer();
  }

  void _initializeTimer() {
    final targetDate = DateTime.utc(2025, 2, 20, 21, 0, 0); // Feb 20, 9 PM UTC
    final now = DateTime.now().toUtc();
    _timeRemaining = targetDate.difference(now);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeRemaining > Duration.zero) {
          _timeRemaining -= Duration(seconds: 1);
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final days = _timeRemaining.inDays;
    final hours = _timeRemaining.inHours % 24;
    final minutes = _timeRemaining.inMinutes % 60;
    final seconds = _timeRemaining.inSeconds % 60;

    return Material(
      color: Colors.transparent,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: const Color(0xFFFFF5DC),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: AppColors.borderColor,
            width: 2.0,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.borderColor,
              offset: const Offset(-5, 5),
              blurRadius: 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Column(
            children: [
              // Title Bar
              Container(
                height: widget.contHeight,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFC978),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(4),
                  ),
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.borderColor,
                      width: 2,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: widget.padding * 2),
                  child: Row(
                    children: [
                      Text(
                        "Countdown",
                        style: TextStyle(
                          fontFamily: "Audiowide",
                          fontSize: widget.fontSizeBanner,
                          color: Color(0xFF704214),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.squareMinus,
                          color: Color(0xFF704214),
                        ),
                        onPressed: widget.onToggleCountdownWindow,
                        iconSize: widget.iconSizeBanner,
                      ),
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.squareXmark,
                          color: Colors.redAccent,
                        ),
                        onPressed: widget.onToggleCountdownWindow,
                        iconSize: widget.iconSizeBanner,
                      ),
                    ],
                  ),
                ),
              ),
              // Timer Display
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(widget.padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Days
                      AnimatedFlipCounter(
                        value: days,
                        textStyle: TextStyle(
                          fontFamily: "Audiowide",
                          fontSize: widget.countdownFontSize,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "d  ",
                        style: TextStyle(
                          fontFamily: "Audiowide",
                          fontSize: widget.countdownFontSize,
                          color: Colors.black54,
                        ),
                      ),
                      // Hours
                      AnimatedFlipCounter(
                        value: hours,
                        textStyle: TextStyle(
                          fontFamily: "Audiowide",
                          fontSize: widget.countdownFontSize,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "h  ",
                        style: TextStyle(
                          fontFamily: "Audiowide",
                          fontSize: widget.countdownFontSize,
                          color: Colors.black54,
                        ),
                      ),
                      // Minutes
                      AnimatedFlipCounter(
                        value: minutes,
                        textStyle: TextStyle(
                          fontFamily: "Audiowide",
                          fontSize: widget.countdownFontSize,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "m  ",
                        style: TextStyle(
                          fontFamily: "Audiowide",
                          fontSize: widget.countdownFontSize,
                          color: Colors.black54,
                        ),
                      ),
                      // Seconds
                      AnimatedFlipCounter(
                        value: seconds,
                        textStyle: TextStyle(
                          fontFamily: "Audiowide",
                          fontSize: widget.countdownFontSize,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "s",
                        style: TextStyle(
                          fontFamily: "Audiowide",
                          fontSize: widget.countdownFontSize,
                          color: Colors.black54,
                        ),
                      ),
                    ],
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
