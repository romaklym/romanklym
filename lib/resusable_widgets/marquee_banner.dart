import 'package:flutter/material.dart';

class MarqueeText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final double velocity;

  const MarqueeText({
    super.key,
    required this.text,
    required this.style,
    this.velocity = 40,
  });

  @override
  State<MarqueeText> createState() => _MarqueeTextState();
}

class _MarqueeTextState extends State<MarqueeText>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late double _screenWidth;
  late double _textWidth;

  late int _repetitionCount;

  double get _totalTextWidth => _repetitionCount * _textWidth;
  double get _maxScroll => _totalTextWidth - _screenWidth;

  bool _isScrolling = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startMarquee();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenWidth = MediaQuery.of(context).size.width;

    final textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: widget.style),
      textDirection: TextDirection.ltr,
    )..layout();

    _textWidth = textPainter.width;

    // Calculate how many repetitions are needed to cover the screen twice.
    final repeatsToFillScreen = (_screenWidth / _textWidth).ceil();
    _repetitionCount = repeatsToFillScreen * 10; // Extra for seamless looping
  }

  void _startMarquee() async {
    if (_isScrolling || !mounted) return;

    _isScrolling = true;
    while (mounted) {
      final duration = Duration(
        milliseconds: ((_maxScroll / widget.velocity) * 1000).round(),
      );

      try {
        if (_scrollController.hasClients) {
          await _scrollController.animateTo(
            _maxScroll,
            duration: duration,
            curve: Curves.linear,
          );

          // Reset the scroll position to the starting point smoothly.
          final resetOffset =
              _textWidth + 10; // Start just beyond the screen width
          _scrollController.jumpTo(resetOffset);
        } else {
          break;
        }
      } catch (e) {
        break;
      }
    }
    _isScrolling = false;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: Row(
          children: List.generate(_repetitionCount, (index) {
            return Text(widget.text, style: widget.style);
          }),
        ),
      ),
    );
  }
}
