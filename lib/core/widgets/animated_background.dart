import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  const AnimatedBackground({super.key, required this.child});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _GradientPainter(_controller.value),
          child: widget.child,
        );
      },
    );
  }
}

class _GradientPainter extends CustomPainter {
  final double progress;

  _GradientPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    // Orbs of color that move around
    final Paint paint = Paint()
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 150);

    // Primary Orb
    final p1X = size.width * (0.5 + 0.3 * sin(progress * 2 * pi));
    final p1Y = size.height * (0.5 + 0.2 * cos(progress * 2 * pi));
    paint.color = const Color(0xFF7F5AF0).withValues(alpha: 0.15);
    canvas.drawCircle(Offset(p1X, p1Y), size.width * 0.4, paint);

    // Secondary Orb
    final p2X = size.width * (0.3 + 0.4 * cos(progress * 2 * pi + 1));
    final p2Y = size.height * (0.7 + 0.3 * sin(progress * 2 * pi + 1));
    paint.color = const Color(0xFF2CB67D).withValues(alpha: 0.1);
    canvas.drawCircle(Offset(p2X, p2Y), size.width * 0.35, paint);

    // Tertiary Orb
    final p3X = size.width * (0.8 + 0.2 * sin(progress * 2 * pi + 2));
    final p3Y = size.height * (0.2 + 0.4 * cos(progress * 2 * pi + 2));
    paint.color = const Color(0xFF6246EA).withValues(alpha: 0.12);
    canvas.drawCircle(Offset(p3X, p3Y), size.width * 0.3, paint);
  }

  @override
  bool shouldRepaint(covariant _GradientPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
