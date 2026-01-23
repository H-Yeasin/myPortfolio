import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LearningStatusWidget extends StatelessWidget {
  const LearningStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                "Growth Check",
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w900,
                ),
              ).animate().fadeIn().slideX(begin: -0.2),
              const SizedBox(height: 12),
              Text(
                "Currently expanding my horizons.",
                style: theme.textTheme.displaySmall?.copyWith(
                  fontSize: isDesktop ? 32 : 24,
                ),
              ).animate(delay: 200.ms).fadeIn().slideX(begin: -0.1),
              const SizedBox(height: 48),

              // The Status Cards
              isDesktop
                  ? Row(children: _buildStatusCards(context))
                  : Column(children: _buildStatusCards(context)),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildStatusCards(BuildContext context) {
    return [
      _StatusCard(
        index: 0,
        label: "CURRENTLY MASTERING",
        title: "Unit & Widget Testing",
        subtitle: "Ensuring 100% code stability",
        icon: Icons.bug_report_rounded,
        color: Colors.redAccent,
        progress: 0.6,
      ),
      const SizedBox(width: 24, height: 24),
      _StatusCard(
        index: 1,
        label: "READING",
        title: "Clean Code",
        subtitle: "by Robert C. Martin",
        icon: Icons.menu_book_rounded,
        color: Colors.blueAccent,
        progress: 0.4,
      ),
      const SizedBox(width: 24, height: 24),
      _StatusCard(
        index: 2,
        label: "EXPERIMENTING WITH",
        title: "Flutter Wasm (Web)",
        subtitle: "Next-gen web performance",
        icon: Icons.speed_rounded,
        color: Colors.greenAccent,
        progress: 0.2,
      ),
    ];
  }
}

class _StatusCard extends StatelessWidget {
  final int index;
  final String label;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final double progress;

  const _StatusCard({
    required this.index,
    required this.label,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isDesktop = MediaQuery.of(context).size.width > 900;

    Widget cardContent = ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: isDark
                ? Colors.white.withValues(alpha: 0.05)
                : Colors.black.withValues(alpha: 0.03),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.1)
                  : Colors.black.withValues(alpha: 0.05),
            ),
          ),
          child: Row(
            children: [
              // Circular Progress Icon
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 3,
                      backgroundColor: color.withValues(alpha: 0.1),
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                    ),
                  ),
                  Icon(icon, size: 20, color: color),
                ],
              ),
              const SizedBox(width: 20),

              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.6,
                        ),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate(delay: (400 + (index * 150)).ms).fadeIn().slideX(begin: 0.1);

    return isDesktop ? Expanded(child: cardContent) : cardContent;
  }
}
