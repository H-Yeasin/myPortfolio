import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final wisdomStatusProvider = StateProvider<String>(
  (ref) => "Click 'Run Code' to fetch a dev insight...",
);
final isLoadingProvider = StateProvider<bool>((ref) => false);

final List<String> _wisdomDatabase = [
  '"Clean Code always looks like it was written by someone who cares." - Robert C. Martin',
  '"First, solve the problem. Then, write the code." - John Johnson',
  '"Simplicity is the soul of efficiency." - Austin Freeman',
  '"In EdTech, if the UI confuses the student, the code has failed." - My Philosophy',
  '"Flutter: Build it once, deploy it everywhere."',
  '"Optimism is an occupational hazard of programming: feedback is the treatment." - Kent Beck',
  '"The best error message is the one that never shows up." - Thomas Fuchs',
];

class PlaygroundWidget extends ConsumerWidget {
  const PlaygroundWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final wisdom = ref.watch(wisdomStatusProvider);
    final isLoading = ref.watch(isLoadingProvider);
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            children: [
              Text(
                'INTERACTIVE PLAYGROUND',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w900,
                ),
              ).animate().fadeIn().slide(begin: const Offset(0, 0.1)),
              const SizedBox(height: 12),
              Text(
                    'Live State Management',
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontSize: isDesktop ? 32 : 24,
                    ),
                  )
                  .animate(delay: 200.ms)
                  .fadeIn()
                  .slide(begin: const Offset(0, 0.1)),
              const SizedBox(height: 12),
              Text(
                    'Test my Riverpod logic with this simulated API playground.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  )
                  .animate(delay: 300.ms)
                  .fadeIn()
                  .slide(begin: const Offset(0, 0.1)),
              const SizedBox(height: 48),
              _TerminalCard(
                    isDark: isDark,
                    isLoading: isLoading,
                    wisdom: wisdom,
                  )
                  .animate(delay: 400.ms)
                  .fadeIn()
                  .scale(
                    begin: const Offset(0.95, 0.95),
                    curve: Curves.easeOutBack,
                  ),
              const SizedBox(height: 48),
              ElevatedButton.icon(
                onPressed: isLoading
                    ? null
                    : () async {
                        ref.read(isLoadingProvider.notifier).state = true;
                        await Future.delayed(
                          const Duration(milliseconds: 1500),
                        );
                        final randomQuote =
                            _wisdomDatabase[Random().nextInt(
                              _wisdomDatabase.length,
                            )];
                        ref.read(wisdomStatusProvider.notifier).state =
                            randomQuote;
                        ref.read(isLoadingProvider.notifier).state = false;
                      },
                icon: const Icon(Icons.play_arrow_rounded),
                label: const Text('Run Code'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: const Color(0xFF080A12),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                  ),
                ),
              ).animate(delay: 600.ms).fadeIn(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TerminalCard extends StatelessWidget {
  final bool isDark;
  final bool isLoading;
  final String wisdom;

  const _TerminalCard({
    required this.isDark,
    required this.isLoading,
    required this.wisdom,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(0.025),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.48)
                  : Colors.white.withValues(alpha: 0.58),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: Colors.white.withValues(alpha: 0.16)),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.secondary.withValues(alpha: 0.14),
                  blurRadius: 36,
                  offset: const Offset(0, 22),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _windowDot(const Color(0xFFFF5F56)),
                    const SizedBox(width: 10),
                    _windowDot(const Color(0xFFFFBD2E)),
                    const SizedBox(width: 10),
                    _windowDot(const Color(0xFF27C93F)),
                    const SizedBox(width: 16),
                    Text(
                      'bash - wisdom_fetcher.dart',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.44,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Divider(color: Colors.white12, height: 1),
                ),
                SizedBox(
                  height: 140,
                  child: Center(
                    child: isLoading
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                strokeWidth: 3,
                                color: isDark
                                    ? const Color(0xFF7EE7D1)
                                    : theme.colorScheme.primary,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                    'FETCHING DATA...',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: theme.colorScheme.onSurface
                                          .withValues(alpha: 0.42),
                                      fontWeight: FontWeight.w900,
                                    ),
                                  )
                                  .animate(
                                    onPlay: (controller) =>
                                        controller.repeat(),
                                  )
                                  .fadeIn(duration: 500.ms)
                                  .fadeOut(delay: 500.ms, duration: 500.ms),
                            ],
                          )
                        : Text(
                            '> $wisdom',
                            style: TextStyle(
                              color: isDark
                                  ? const Color(0xFF7EE7D1)
                                  : theme.colorScheme.primary,
                              fontFamily: 'Courier',
                              fontSize: 18,
                              height: 1.5,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ).animate().fadeIn(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _windowDot(Color color) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
