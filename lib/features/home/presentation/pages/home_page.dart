import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/theme_provider.dart';
import '../../../../core/widgets/animated_background.dart';
import '../../../../features/portfolio/presentation/providers/project_providers.dart';
import '../../../../features/portfolio/presentation/widgets/project_card.dart';
import '../../../about/presentation/widgets/edtech_philosophy.dart';
import '../../../about/presentation/widgets/learning_status_widget.dart';
import '../../../about/presentation/widgets/technical_writing_widget.dart';
import '../widgets/hero_section.dart';
import '../widgets/playground_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final projectsAsync = ref.watch(projectsProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'H. U. Yeasin',
            style: theme.textTheme.displaySmall?.copyWith(
              fontSize: 32,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
            ),
            onPressed: () {
              ref.read(themeModeProvider.notifier).toggleTheme(isDark);
            },
          ),
          const SizedBox(width: 32),
        ],
      ),
      body: AnimatedBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100), // Spacing for AppBar
                  const HeroSection(),
                  const EdTechPhilosophyWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'SELECTED PROJECTS',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.primary,
                        letterSpacing: 4,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  projectsAsync.when(
                    data: (projects) {
                      return LayoutBuilder(
                        builder: (context, constraints) {
                          int crossAxisCount = 1;
                          if (constraints.maxWidth > 1000) {
                            crossAxisCount = 3;
                          } else if (constraints.maxWidth > 700) {
                            crossAxisCount = 2;
                          }

                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount,
                                  crossAxisSpacing: 32,
                                  mainAxisSpacing: 32,
                                  childAspectRatio: 0.8,
                                ),
                            itemCount: projects.length,
                            itemBuilder: (context, index) {
                              return ProjectCard(
                                project: projects[index],
                                index: index,
                              );
                            },
                          );
                        },
                      );
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, stack) =>
                        Center(child: Text('Error: $error')),
                  ),
                  const SizedBox(height: 120),
                  const TechnicalWritingWidget(),
                  const PlaygroundWidget(),
                  const LearningStatusWidget(),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
