import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theme/app_theme.dart';
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
    final appColors = theme.appColors;
    final textTheme = theme.textTheme;
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 920;

    final intro = Column(
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        _buildPill(context, 'AVAILABLE FOR FLUTTER + EDTECH WORK')
            .animate()
            .fadeIn(duration: 650.ms)
            .slideY(begin: 0.2, curve: Curves.easeOutExpo),
        const SizedBox(height: 24),
        Text(
          'Habib Ullah Yeasin',
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
          style: textTheme.displayLarge?.copyWith(
            fontSize: isDesktop ? 70 : 42,
            height: 1.02,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [
                  theme.colorScheme.primary,
                  theme.colorScheme.secondary,
                  AppTheme.warmAccent,
                ],
              ).createShader(bounds),
              child: TypewriterText(
                text: 'Flutter Developer\nEdTech Product Thinker',
                duration: const Duration(milliseconds: 4200),
                style: textTheme.displayMedium?.copyWith(
                  fontSize: isDesktop ? 44 : 30,
                  color: Colors.white,
                ),
              ),
            )
            .animate(delay: 160.ms)
            .fadeIn(duration: 800.ms)
            .slideY(begin: 0.16, curve: Curves.easeOutExpo),
        const SizedBox(height: 26),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Text(
            'I design polished Flutter experiences with clean architecture, useful motion, and learning-first UX decisions.',
            textAlign: isDesktop ? TextAlign.start : TextAlign.center,
            style: textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.72),
            ),
          ),
        ),
        const SizedBox(height: 34),
        Wrap(
              spacing: 14,
              runSpacing: 14,
              alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
              children: [
                _buildSocialButton(
                  context,
                  'GitHub',
                  Icons.code_rounded,
                  () => _launchURL('https://github.com/H-Yeasin'),
                  filled: true,
                ),
                _buildSocialButton(
                  context,
                  'LinkedIn',
                  Icons.work_outline_rounded,
                  () => _launchURL('https://linkedin.com/in/habibullahyeasin'),
                ),
                _buildSocialButton(
                  context,
                  'Resume',
                  Icons.description_outlined,
                  () => _launchURL(
                    'https://h-yeasin.github.io/my-resume/Habib_Ullah_Yeasin_Resume.pdf',
                  ),
                ),
              ],
            )
            .animate(delay: 430.ms)
            .fadeIn(duration: 800.ms)
            .slideY(begin: 0.16, curve: Curves.easeOutExpo),
      ],
    );

    final profile = Align(
      alignment: Alignment.center,
      child: _buildProfileGlass(context)
          .animate(delay: 520.ms)
          .fadeIn(duration: 850.ms)
          .scale(begin: const Offset(0.92, 0.92), curve: Curves.easeOutBack),
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(20, isDesktop ? 90 : 56, 20, 72),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 6, child: intro),
                const SizedBox(width: 56),
                Expanded(flex: 4, child: profile),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [intro, const SizedBox(height: 46), profile],
            ),
    );
  }

  Widget _buildPill(BuildContext context, String text) {
    final theme = Theme.of(context);
    final appColors = theme.appColors;
    return ClipRRect(
      borderRadius: BorderRadius.circular(99),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: appColors.glassSurface,
            borderRadius: BorderRadius.circular(99),
            border: Border.all(color: appColors.softBorder),
          ),
          child: Text(
            text,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.secondary,
              fontWeight: FontWeight.w900,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileGlass(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.appColors;

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(-0.09)
        ..rotateX(0.05),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(34),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: Container(
            width: 360,
            constraints: const BoxConstraints(maxWidth: 360),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: appColors.glassSurface,
              borderRadius: BorderRadius.circular(34),
              border: Border.all(color: appColors.softBorder),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary.withValues(alpha: 0.18),
                  blurRadius: 40,
                  offset: const Offset(0, 24),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 10,
                  top: 6,
                  child: Transform.rotate(
                    angle: math.pi / 4,
                    child: Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.secondary.withValues(
                          alpha: 0.16,
                        ),
                        border: Border.all(
                          color: theme.colorScheme.secondary.withValues(
                            alpha: 0.34,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/myImage.png'),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.34),
                          width: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        _buildMetric(context, '3+', 'Apps'),
                        const SizedBox(width: 12),
                        _buildMetric(context, 'Clean', 'Architecture'),
                        const SizedBox(width: 12),
                        _buildMetric(context, 'UX', 'EdTech'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMetric(BuildContext context, String value, String label) {
    final theme = Theme.of(context);
    final appColors = theme.appColors;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: appColors.glassSurfaceStrong,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: appColors.softBorder),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w900,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.56),
                fontSize: 11,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(
    BuildContext context,
    String label,
    IconData icon,
    VoidCallback onPressed, {
    bool filled = false,
  }) {
    final theme = Theme.of(context);
    final appColors = theme.appColors;

    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 19),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        backgroundColor: filled
            ? theme.colorScheme.primary
            : appColors.glassSurfaceStrong,
        foregroundColor: filled
            ? theme.colorScheme.onPrimary
            : theme.colorScheme.onSurface,
        side: BorderSide(
          color: filled ? Colors.transparent : appColors.softBorder,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
    );
  }
}
