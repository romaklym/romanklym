import 'dart:async';
import 'package:flutter/material.dart';

class ClockWidget extends StatefulWidget {
  final double fontSize;
  const ClockWidget({
    super.key,
    this.fontSize = 14.0,
  });

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  late Timer _timer;
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFEB6133),
        border: Border.all(color: Colors.black54, width: 1.5),
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF704214), // Shadow color
            offset: const Offset(-5, 5),
            blurRadius: 0,
          ),
        ],
      ),
      child: Text(
        "${_currentTime.hour.toString().padLeft(2, '0')}:${_currentTime.minute.toString().padLeft(2, '0')}",
        style: TextStyle(
          fontFamily: "Audiowide",
          fontSize: widget.fontSize,
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
