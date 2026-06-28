import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/widgets/animated_background.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildVisuals(context),
        const SizedBox(height: 80),
        _buildContent(context),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildVisuals(context),
        const SizedBox(height: 30),
        _buildContent(context),
      ],
    );
  }

  Widget _buildVisuals(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      height: 300,
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
                  Icons.school_rounded,
                  size: 80,
                  color: Colors.tealAccent.withValues(alpha: 0.8),
                ),
                const SizedBox(height: 20),
                Text(
                  "Educational Technology\nMeet Engineering",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    height: 1.5,
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
          "From EdTech Graduate to Flutter Dev",
          style: theme.textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ).animate().fadeIn().slideX(begin: -0.1),
        const SizedBox(height: 20),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.tealAccent.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            "CAREER & PHILOSOPHY",
            style: theme.textTheme.labelLarge?.copyWith(
              color: Colors.tealAccent,
              letterSpacing: 0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ).animate(delay: 200.ms).fadeIn(),

        const SizedBox(height: 48),

        // Intro
        Text(
          "How my background in Educational Technology helps me write better logic for Learning Management Systems.",
          style: theme.textTheme.headlineSmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
            fontStyle: FontStyle.italic,
          ),
        ).animate(delay: 300.ms).fadeIn(),

        const SizedBox(height: 60),

        // 1. Instructional Design
        _buildSection(
          context,
          "1. Instructional Design → Better UI/UX Logic",
          "In my EdTech courses, I studied Instructional Design and Cognitive Load Theory. I learned that if a learner is overwhelmed by a complex interface, they stop learning.\n\n"
              "The Dev Application: When I build a UI in Flutter, I don't just dump widgets onto the screen. I use my training to design 'Scaffolded' UX—interfaces that progressively reveal features as the user gets comfortable.\n\n"
              "The Code: Instead of one massive form, I break data entry into a PageView with progress indicators, reducing the cognitive load. I implement logic that 'guides' the user, similar to how a teacher guides a student.",
          delay: 400,
        ),

        const SizedBox(height: 48),

        // 2. Database Systems
        _buildSection(
          context,
          "2. Database Systems → Adaptive Learning Paths",
          "My engineering coursework in DBMS taught me how to structure data. But my EdTech background taught me what data matters.\n\n"
              "The Dev Application: A standard developer might just store a test score. I structure Firestore schemas to track the learning journey (time_spent, attempts, weak_areas).\n\n"
              "The Result: This allows me to write backend logic that is Adaptive. If a user fails a quiz, my app logic automatically recommends remedial content.",
          delay: 500,
        ),

        const SizedBox(height: 48),

        // 3. Psychology
        _buildSection(
          context,
          "3. Psychology → Gamification Logic",
          "One of the core subjects in EdTE is Educational Psychology. We learned what keeps students motivated (Intrinsic vs Extrinsic).\n\n"
              "The Code: I use Riverpod/Bloc to manage 'Streak States' and 'Achievement Unlocks' that trigger exactly when the user is most likely to drop off, re-engaging them instantly.",
          delay: 600,
        ),

        const SizedBox(height: 48),

        // Conclusion
        _buildSection(
          context,
          "The Engineering Bridge",
          "I don't just build apps that function; I build apps that teach. My degree didn't just teach me how to write code—it taught me how to engineer human potential. And that is the logic I bring to every Flutter project.",
          delay: 700,
        ),

        const SizedBox(height: 60),
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
        Text(
          title,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          content,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            height: 1.8,
            fontSize: 18,
          ),
        ),
      ],
    ).animate(delay: delay.ms).fadeIn().slideY(begin: 0.1);
  }
}
