import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class EdTechPhilosophyWidget extends StatelessWidget {
  const EdTechPhilosophyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // Section Header
              Text(
                "The EdTech Advantage",
                style: theme.textTheme.displayMedium?.copyWith(
                  fontSize: isDesktop ? 48 : 32,
                  height: 1.1,
                ),
              ).animate().fadeIn().slideY(begin: 0.1),
              const SizedBox(height: 16),
              Text(
                "Why a B.Sc. in Educational Technology makes me a better developer.",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ).animate(delay: 200.ms).fadeIn().slideY(begin: 0.1),
              const SizedBox(height: 60),

              // The Grid of Advantages
              isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildPhilosophyCards(context),
                    )
                  : Column(children: _buildPhilosophyCards(context)),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPhilosophyCards(BuildContext context) {
    return [
      _PhilosophyCard(
        index: 0,
        icon: Icons.psychology_outlined,
        title: "Cognitive Load Theory",
        description:
            "I design UIs that minimize distractions. A student's brain power should be used for learning, not figuring out how to use the app.",
        color: Colors.blueAccent,
      ),
      const SizedBox(width: 24, height: 24),
      _PhilosophyCard(
        index: 1,
        icon: Icons.architecture_outlined,
        title: "LMS Architecture",
        description:
            "I understand the data structures needed for quizzes, progress tracking, and gamification because I've studied Instructional Design.",
        color: Colors.orangeAccent,
      ),
      const SizedBox(width: 24, height: 24),
      _PhilosophyCard(
        index: 2,
        icon: Icons.accessibility_new_outlined,
        title: "Inclusive Design",
        description:
            "Education is for everyone. I prioritize accessibility features to ensure learners of all abilities can use my applications.",
        color: Colors.teal,
      ),
    ];
  }
}

class _PhilosophyCard extends StatelessWidget {
  final int index;
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _PhilosophyCard({
    required this.index,
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isDesktop = MediaQuery.of(context).size.width > 900;

    Widget cardContent = ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: isDark
                ? Colors.white.withValues(alpha: 0.05)
                : Colors.black.withValues(alpha: 0.03),
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.1)
                  : Colors.black.withValues(alpha: 0.05),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, size: 32, color: color),
              ),
              const SizedBox(height: 24),
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate(delay: (400 + (index * 100)).ms).fadeIn().slideY(begin: 0.1);

    return isDesktop ? Expanded(child: cardContent) : cardContent;
  }
}
