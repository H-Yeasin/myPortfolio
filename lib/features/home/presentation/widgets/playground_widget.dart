import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/legacy.dart';

// --- 1. THE LOGIC (Riverpod) ---
final wisdomStatusProvider = StateProvider<String>(
  (ref) => "Click 'Run Code' to fetch a dev insight...",
);
final isLoadingProvider = StateProvider<bool>((ref) => false);

final List<String> _wisdomDatabase = [
  "“Clean Code always looks like it was written by someone who cares.” — Robert C. Martin",
  "“First, solve the problem. Then, write the code.” — John Johnson",
  "“Simplicity is the soul of efficiency.” — Austin Freeman",
  "“In EdTech, if the UI confuses the student, the code has failed.” — My Philosophy",
  "“Flutter: Build it once, deploy it everywhere.”",
  "“Optimism is an occupational hazard of programming: feedback is the treatment.” — Kent Beck",
  "“The best error message is the one that never shows up.” — Thomas Fuchs",
];

// --- 2. THE UI (Widget) ---
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
              // Header
              Text(
                "INTERACTIVE PLAYGROUND",
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w900,
                ),
              ).animate().fadeIn().slide(begin: const Offset(0, 0.1)),
              const SizedBox(height: 12),
              Text(
                    "Live State Management",
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontSize: isDesktop ? 32 : 24,
                    ),
                  )
                  .animate(delay: 200.ms)
                  .fadeIn()
                  .slide(begin: const Offset(0, 0.1)),
              const SizedBox(height: 12),
              Text(
                    "Test my Riverpod logic with this simulated API playground.",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  )
                  .animate(delay: 300.ms)
                  .fadeIn()
                  .slide(begin: const Offset(0, 0.1)),
              const SizedBox(height: 48),

              // The Terminal Window
              ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: isDark
                              ? Colors.black.withValues(alpha: 0.6)
                              : Colors.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: isDark
                                ? Colors.white.withValues(alpha: 0.1)
                                : Colors.black.withValues(alpha: 0.05),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 30,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Window Header
                            Row(
                              children: [
                                _windowDot(const Color(0xFFFF5F56)),
                                const SizedBox(width: 10),
                                _windowDot(const Color(0xFFFFBD2E)),
                                const SizedBox(width: 10),
                                _windowDot(const Color(0xFF27C93F)),
                                const SizedBox(width: 16),
                                Text(
                                  "bash — wisdom_fetcher.dart",
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: theme.colorScheme.onSurface
                                        .withValues(alpha: 0.4),
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 24),
                              child: Divider(color: Colors.white12, height: 1),
                            ),

                            // Terminal Content
                            SizedBox(
                              height: 140,
                              child: Center(
                                child: isLoading
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircularProgressIndicator(
                                            strokeWidth: 3,
                                            color: isDark
                                                ? const Color(0xFF98C379)
                                                : theme.colorScheme.primary,
                                          ),
                                          const SizedBox(height: 20),
                                          Text(
                                                "FETCHING DATA...",
                                                style: theme
                                                    .textTheme
                                                    .labelSmall
                                                    ?.copyWith(
                                                      color: theme
                                                          .colorScheme
                                                          .onSurface
                                                          .withValues(
                                                            alpha: 0.4,
                                                          ),
                                                      letterSpacing: 2.0,
                                                    ),
                                              )
                                              .animate(
                                                onPlay: (controller) =>
                                                    controller.repeat(),
                                              )
                                              .fadeIn(duration: 500.ms)
                                              .fadeOut(
                                                delay: 500.ms,
                                                duration: 500.ms,
                                              ),
                                        ],
                                      )
                                    : Text(
                                        "> $wisdom",
                                        style: TextStyle(
                                          color: isDark
                                              ? const Color(0xFF98C379)
                                              : theme.colorScheme.primary,
                                          fontFamily: 'Courier',
                                          fontSize: 18,
                                          height: 1.5,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ).animate().fadeIn(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .animate(delay: 400.ms)
                  .fadeIn()
                  .scale(
                    begin: const Offset(0.95, 0.95),
                    curve: Curves.easeOutBack,
                  ),
              const SizedBox(height: 48),

              // Action Button
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
                label: const Text("Run Code"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 24,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                    fontSize: 14,
                  ),
                  elevation: 0,
                ),
              ).animate(delay: 600.ms).fadeIn(),
            ],
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
