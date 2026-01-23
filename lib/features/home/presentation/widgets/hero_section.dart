import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/widgets/typewriter_text.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello, I\'m Habib Ullah Yeasin.',
            style: textTheme.displayLarge,
          ),
          const SizedBox(height: 16),
          TypewriterText(
                text: 'Flutter Developer & EdTech Enthusiast',
                duration: const Duration(milliseconds: 4500),
                style: textTheme.displayMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              )
              .animate(delay: 200.ms)
              .fadeIn(duration: 800.ms)
              .slideY(begin: 0.2, end: 0, curve: Curves.easeOutExpo),
          const SizedBox(height: 32),
          ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Text(
                  "I combine technical expertise in Flutter with a deep understanding of educational technology. I build scalable apps using Clean Architecture and Riverpod.",
                  style: textTheme.bodyLarge,
                ),
              )
              .animate(delay: 400.ms)
              .fadeIn(duration: 800.ms)
              .slideY(begin: 0.2, end: 0, curve: Curves.easeOutExpo),
          const SizedBox(height: 48),
          Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  _buildSocialButton(
                    context,
                    'GitHub',
                    Icons.code_rounded,
                    () => _launchURL('https://github.com/Yeasin84'),
                  ),
                  _buildSocialButton(
                    context,
                    'LinkedIn',
                    Icons.work_outline_rounded,
                    () =>
                        _launchURL('https://linkedin.com/in/habibullahyeasin'),
                  ),
                  _buildSocialButton(
                    context,
                    'Resume',
                    Icons.description_outlined,
                    () => _launchURL(
                      'https://yeasin84.github.io/my-resume/Habib_Ullah_Yeasin_Resume.pdf',
                    ),
                  ),
                ],
              )
              .animate(delay: 600.ms)
              .fadeIn(duration: 800.ms)
              .slideY(begin: 0.2, end: 0, curve: Curves.easeOutExpo),
        ],
      ),
    );
  }

  Widget _buildSocialButton(
    BuildContext context,
    String label,
    IconData icon,
    VoidCallback onPressed,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 20),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        backgroundColor: isDark
            ? Colors.white.withValues(alpha: 0.05)
            : Colors.black.withValues(alpha: 0.05),
        foregroundColor: theme.colorScheme.onSurface,
        elevation: 0,
        side: BorderSide(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
          width: 1,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
    );
  }
}
