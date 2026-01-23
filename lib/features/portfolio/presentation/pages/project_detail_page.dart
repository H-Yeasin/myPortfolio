import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/widgets/animated_background.dart';

class ProjectDetailPage extends ConsumerWidget {
  final String projectId;

  const ProjectDetailPage({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: AnimatedBackground(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1400),
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 120,
              ),
              child: isDesktop
                  ? _buildDesktopLayout(context)
                  : _buildMobileLayout(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 5, child: _buildContent(context)),
        const SizedBox(width: 80),
        Expanded(flex: 4, child: _buildVisuals(context)),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildVisuals(context),
        const SizedBox(height: 60),
        _buildContent(context),
      ],
    );
  }

  Widget _buildVisuals(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      height: 600,
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.05)
            : Colors.black.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.black.withValues(alpha: 0.05),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone_iphone_rounded,
                  size: 80,
                  color: theme.colorScheme.primary.withValues(alpha: 0.3),
                ),
                const SizedBox(height: 20),
                Text(
                  "App Mockup Image Here\n(Add asset later)",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate().scale(duration: 800.ms, curve: Curves.easeOutBack);
  }

  Widget _buildContent(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Header
        Text(
          "Language Learning App",
          style: theme.textTheme.displayMedium,
        ).animate().fadeIn().slideX(begin: -0.1),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            "CASE STUDY: LMS & EDTECH",
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.primary,
              letterSpacing: 2,
            ),
          ),
        ).animate(delay: 200.ms).fadeIn(),
        const SizedBox(height: 60),

        // 2. The Problem
        _buildSection(
          context,
          "The Challenge",
          "Learning a new language requires consistent practice, but many students in remote areas lack stable internet. The challenge was to create an app that could handle audio lessons and quiz logic entirely offline without consuming too much device storage.",
          delay: 400,
        ),

        const SizedBox(height: 48),

        // 3. The Solution
        _buildSection(
          context,
          "The Solution",
          "I implemented a 'Smart Caching' strategy using Hive. Instead of streaming audio, lessons are downloaded in compressed batches. I also used Riverpod to manage the complex state of the quizzes, ensuring that user progress is saved locally and synced only when the internet returns.",
          delay: 600,
        ),

        const SizedBox(height: 48),

        // 4. Tech Stack
        Text(
          "Tech Stack",
          style: theme.textTheme.headlineMedium,
        ).animate(delay: 800.ms).fadeIn(),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _techChip(context, "Flutter"),
            _techChip(context, "Riverpod"),
            _techChip(context, "Hive DB"),
            _techChip(context, "Clean Architecture"),
            _techChip(context, "Audioplayers"),
          ],
        ).animate(delay: 900.ms).fadeIn().slideY(begin: 0.1),
      ],
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    String content, {
    required int delay,
  }) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.headlineMedium),
        const SizedBox(height: 16),
        Text(
          content,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ],
    ).animate(delay: delay.ms).fadeIn().slideY(begin: 0.1);
  }

  Widget _techChip(BuildContext context, String label) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
        ),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelLarge?.copyWith(fontSize: 14),
      ),
    );
  }
}
