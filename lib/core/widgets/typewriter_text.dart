import 'dart:async';
import 'package:flutter/material.dart';

class TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration duration;
  final Duration delay;
  final bool showCursor;

  const TypewriterText({
    super.key,
    required this.text,
    this.style,
    this.duration = const Duration(milliseconds: 2000),
    this.delay = Duration.zero,
    this.showCursor = true,
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _characterCount;
  bool _isCursorVisible = true;
  Timer? _cursorTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _characterCount = IntTween(
      begin: 0,
      end: widget.text.length,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _startAnimation();
  }

  Future<void> _startAnimation() async {
    if (widget.delay > Duration.zero) {
      await Future.delayed(widget.delay);
    }
    if (mounted) {
      _controller.forward();
      if (widget.showCursor) {
        _startCursorBlink();
      }
    }
  }

  void _startCursorBlink() {
    _cursorTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (mounted) {
        setState(() {
          _isCursorVisible = !_isCursorVisible;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _cursorTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _characterCount,
      builder: (context, child) {
        final textToShow = widget.text.substring(0, _characterCount.value);
        final isFinished = _characterCount.value == widget.text.length;

        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(textToShow, style: widget.style),
            if (widget.showCursor && (_isCursorVisible || !isFinished))
              Text(
                '|',
                style: widget.style?.copyWith(
                  color: widget.style?.color?.withValues(alpha: 0.5),
                  fontWeight: FontWeight.w100,
                ),
              ),
          ],
        );
      },
    );
  }
}
