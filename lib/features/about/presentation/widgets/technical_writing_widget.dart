import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../pages/article_detail_screen.dart';

class TechnicalWritingWidget extends StatelessWidget {
  const TechnicalWritingWidget({super.key});

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
              // Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "TECHNICAL WRITING",
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.colorScheme.primary,
                          letterSpacing: 4,
                          fontWeight: FontWeight.w900,
                        ),
                      ).animate().fadeIn().slideX(begin: -0.2),
                      const SizedBox(height: 12),
                      Text(
                        "Insights & Authority",
                        style: theme.textTheme.displaySmall?.copyWith(
                          fontSize: isDesktop ? 32 : 24,
                        ),
                      ).animate(delay: 200.ms).fadeIn().slideX(begin: -0.1),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Medium articles coming soon!'),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          "View All",
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 16,
                          color: theme.colorScheme.primary,
                        ),
                      ],
                    ),
                  ).animate(delay: 400.ms).fadeIn(),
                ],
              ),
              const SizedBox(height: 48),

              // Article Grid
              isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildArticleCards(context),
                    )
                  : Column(children: _buildArticleCards(context)),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildArticleCards(BuildContext context) {
    return [
      _ArticleCard(
        index: 0,
        tag: "API TESTING",
        title: "Mastering API Integration in Flutter",
        summary:
            "How I use my Postman Student Expert skills to debug REST APIs before writing a single line of Dart code.",
        readTime: "3 min read",
        color: Colors.orangeAccent,
      ),
      const SizedBox(width: 24, height: 24),
      _ArticleCard(
        index: 1,
        tag: "OFFLINE FIRST",
        title: "Why Hive is Perfect for EdTech Apps",
        summary:
            "A deep dive into caching audio lessons locally so students can learn without internet (Case Study: Language App).",
        readTime: "5 min read",
        color: Colors.blueAccent,
      ),
      const SizedBox(width: 24, height: 24),
      _ArticleCard(
        index: 2,
        tag: "CAREER",
        title: "From EdTech Graduate to Flutter Dev",
        summary:
            "How my background in Educational Technology helps me write better logic for Learning Management Systems.",
        readTime: "4 min read",
        color: Colors.tealAccent,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ArticleDetailScreen(),
            ),
          );
        },
      ),
    ];
  }
}

class _ArticleCard extends StatefulWidget {
  final int index;
  final String tag;
  final String title;
  final String summary;
  final String readTime;
  final Color color;
  final VoidCallback? onTap;

  const _ArticleCard({
    required this.index,
    required this.tag,
    required this.title,
    required this.summary,
    required this.readTime,
    required this.color,
    this.onTap,
  });

  @override
  State<_ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<_ArticleCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isDesktop = MediaQuery.of(context).size.width > 900;

    Widget cardContent = MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child:
          AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutCubic,
                transform: _isHovered
                    ? (Matrix4.identity()
                        ..translate(0.0, -8.0)
                        ..scale(1.02, 1.02))
                    : Matrix4.identity(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
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
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: widget.onTap,
                          borderRadius: BorderRadius.circular(24),
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Tag
                                Text(
                                  widget.tag,
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: widget.color,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                                const SizedBox(height: 16),

                                // Title
                                Text(
                                  widget.title,
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                  ),
                                ),
                                const SizedBox(height: 12),

                                // Summary
                                Text(
                                  widget.summary,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.colorScheme.onSurface
                                        .withValues(alpha: 0.6),
                                    height: 1.6,
                                  ),
                                ),
                                const SizedBox(height: 32),

                                // Footer
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time_rounded,
                                      size: 16,
                                      color: theme.colorScheme.onSurface
                                          .withValues(alpha: 0.3),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      widget.readTime,
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: theme.colorScheme.onSurface
                                                .withValues(alpha: 0.4),
                                          ),
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.arrow_right_alt_rounded,
                                      color: _isHovered
                                          ? widget.color
                                          : theme.colorScheme.onSurface
                                                .withValues(alpha: 0.3),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .animate(delay: (400 + (widget.index * 150)).ms)
              .fadeIn()
              .slideY(begin: 0.1, curve: Curves.easeOutBack),
    );

    return isDesktop ? Expanded(child: cardContent) : cardContent;
  }
}
