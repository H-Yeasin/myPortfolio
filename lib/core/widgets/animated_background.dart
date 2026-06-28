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
    final rect = Offset.zero & size;
    final basePaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF090B14),
          Color(0xFF141827),
          Color(0xFF19131D),
        ],
      ).createShader(rect);
    canvas.drawRect(rect, basePaint);

    _drawGrid(canvas, size);
    _drawGeometry(
      canvas,
      center: Offset(
        size.width * (0.18 + 0.03 * sin(progress * 2 * pi)),
        size.height * 0.18,
      ),
      radius: size.shortestSide * 0.12,
      sides: 6,
      rotation: progress * 2 * pi,
      color: const Color(0xFFA7B8FF),
    );
    _drawGeometry(
      canvas,
      center: Offset(
        size.width * 0.82,
        size.height * (0.28 + 0.04 * cos(progress * 2 * pi)),
      ),
      radius: size.shortestSide * 0.16,
      sides: 4,
      rotation: -progress * 1.5 * pi,
      color: const Color(0xFF7EE7D1),
    );
    _drawGeometry(
      canvas,
      center: Offset(
        size.width * (0.55 + 0.03 * cos(progress * 2 * pi)),
        size.height * 0.78,
      ),
      radius: size.shortestSide * 0.18,
      sides: 3,
      rotation: progress * pi,
      color: const Color(0xFFFFD6A5),
    );
  }

  void _drawGrid(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.035)
      ..strokeWidth = 1;
    const gap = 56.0;

    for (double x = 0; x < size.width; x += gap) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += gap) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  void _drawGeometry(
    Canvas canvas, {
    required Offset center,
    required double radius,
    required int sides,
    required double rotation,
    required Color color,
  }) {
    final path = Path();
    for (int i = 0; i < sides; i++) {
      final angle = rotation + (2 * pi * i / sides);
      final point = Offset(
        center.dx + cos(angle) * radius,
        center.dy + sin(angle) * radius,
      );
      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }
    path.close();

    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.fill
        ..color = color.withValues(alpha: 0.055),
    );
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.4
        ..color = color.withValues(alpha: 0.22),
    );
  }

  @override
  bool shouldRepaint(covariant _GradientPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
