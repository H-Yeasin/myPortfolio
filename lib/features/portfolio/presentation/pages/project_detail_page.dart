import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/widgets/animated_background.dart';

class ProjectDetailPage extends ConsumerWidget {
  final String projectId;

  const ProjectDetailPage({super.key, required this.projectId});

  // Data Map for Project Details
  static final Map<String, _ProjectDetailData> _projectData = {
    '1': _ProjectDetailData(
      title: "Language Learning App",
      category: "CASE STUDY: LMS & EDTECH",
      challengeDescription:
          "Learning a new language requires consistent practice, but many students in remote areas lack stable internet. The challenge was to create an app that could handle audio lessons and quiz logic entirely offline without consuming too much device storage.",
      solutionDescription:
          "I implemented a 'Smart Caching' strategy using Hive. Instead of streaming audio, lessons are downloaded in compressed batches. I also used Riverpod to manage the complex state of the quizzes, ensuring that user progress is saved locally and synced only when the internet returns.",
      techStack: [
        "Flutter",
        "Riverpod",
        "Hive DB",
        "Clean Architecture",
        "Audioplayers",
      ],
      icon: Icons.phone_iphone_rounded,
      mockupText: "App Mockup Image Here\n(Add asset later)",
    ),
    '2': _ProjectDetailData(
      title: "ArogyaPath",
      category: "HEALTHCARE & TELEMEDICINE",
      challengeDescription:
          "The healthcare process in Bangladesh is often manual and fragmented, making it difficult for patients to find doctors and manage records efficiently.",
      solutionDescription:
          "A comprehensive Flutter app facilitating easy doctor appointment scheduling, secure medical record management, and offering real-time health news and emergency services to streamline healthcare access.",
      techStack: ["Flutter", "Firebase", "Dart", "REST API", "Google Maps"],
      icon: Icons.local_hospital_rounded,
      mockupText: "AroggyaPath Screen\n(Add asset later)",
    ),
    '3': _ProjectDetailData(
      title: "GetX Showcase",
      category: "ARCHITECTURE & STATE MANAGEMENT",
      challengeDescription:
          "Many developers find it challenging to implement clean, scalable architecture with efficient state management in production applications.",
      solutionDescription:
          "A production-ready reference app demonstrating best practices with GetX for state management, navigation, and dependency injection, wrapped in a polished Material 3 UI.",
      techStack: [
        "Flutter",
        "GetX",
        "Material 3",
        "Google Fonts",
        "Clean Architecture",
      ],
      icon: Icons.layers_rounded,
      mockupText: "GetX Clean Arch",
      imageAsset: "assets/images/getXShowcase1.gif",
    ),
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDesktop = MediaQuery.of(context).size.width > 900;
    // Fallback to project '1' if id not found, or show empty/error
    final data = _projectData[projectId] ?? _projectData['1']!;

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
                  ? _buildDesktopLayout(context, data)
                  : _buildMobileLayout(context, data),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, _ProjectDetailData data) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 5, child: _buildContent(context, data)),
        const SizedBox(width: 80),
        Expanded(flex: 4, child: _buildVisuals(context, data)),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, _ProjectDetailData data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildVisuals(context, data),
        const SizedBox(height: 60),
        _buildContent(context, data),
      ],
    );
  }

  Widget _buildVisuals(BuildContext context, _ProjectDetailData data) {
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
                if (data.imageAsset != null)
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Image.asset(data.imageAsset!, fit: BoxFit.contain),
                  )
                else
                  Icon(
                    data.icon,
                    size: 80,
                    color: theme.colorScheme.primary.withValues(alpha: 0.3),
                  ),
                const SizedBox(height: 20),
                Text(
                  data.mockupText,
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

  Widget _buildContent(BuildContext context, _ProjectDetailData data) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Header
        Text(
          data.title,
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
            data.category,
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
          data.challengeDescription,
          delay: 400,
        ),

        const SizedBox(height: 48),

        // 3. The Solution
        _buildSection(
          context,
          "The Solution",
          data.solutionDescription,
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
          children: data.techStack
              .map((tech) => _techChip(context, tech))
              .toList(),
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

class _ProjectDetailData {
  final String title;
  final String category;
  final String challengeDescription;
  final String solutionDescription;
  final List<String> techStack;
  final IconData icon;
  final String mockupText;
  final String? imageAsset;

  const _ProjectDetailData({
    required this.title,
    required this.category,
    required this.challengeDescription,
    required this.solutionDescription,
    required this.techStack,
    required this.icon,
    required this.mockupText,
    this.imageAsset,
  });
}
