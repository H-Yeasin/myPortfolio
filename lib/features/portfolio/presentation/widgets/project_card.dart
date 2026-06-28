import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../domain/entities/project_entity.dart';
import '../pages/project_detail_page.dart';

class ProjectCard extends StatefulWidget {
  final ProjectEntity project;
  final int index;

  const ProjectCard({super.key, required this.project, required this.index});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final accentColors = [
      theme.colorScheme.primary,
      theme.colorScheme.secondary,
      const Color(0xFFFFD6A5),
    ];
    final accent = accentColors[widget.index % accentColors.length];

    return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProjectDetailPage(projectId: widget.project.id),
              ),
            );
          },
          child: MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              transform: _isHovered
                  ? (Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..translate(0.0, -12.0, 18.0)
                      ..rotateX(0.035)
                      ..rotateY(-0.045)
                      ..scale(1.025, 1.025))
                  : Matrix4.identity(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                  child: Container(
                    padding: const EdgeInsets.all(32.0),
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.075)
                          : Colors.white.withValues(alpha: 0.64),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: _isHovered
                            ? accent.withValues(alpha: 0.54)
                            : Colors.white.withValues(alpha: 0.16),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: accent.withValues(alpha: _isHovered ? 0.22 : 0.1),
                          blurRadius: _isHovered ? 34 : 22,
                          offset: const Offset(0, 20),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -18,
                          top: -18,
                          child: Transform.rotate(
                            angle: 0.75,
                            child: Container(
                              width: 86,
                              height: 86,
                              decoration: BoxDecoration(
                                color: accent.withValues(alpha: 0.11),
                                borderRadius: BorderRadius.circular(22),
                                border: Border.all(
                                  color: accent.withValues(alpha: 0.18),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: accent.withValues(alpha: 0.14),
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: accent.withValues(alpha: 0.2),
                                    ),
                                  ),
                                  child: Text(
                                    '0${widget.index + 1}',
                                    style: theme.textTheme.labelLarge?.copyWith(
                                      color: accent,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.north_east_rounded,
                                  color: _isHovered
                                      ? accent
                                      : theme.colorScheme.onSurface.withValues(
                                          alpha: 0.34,
                                        ),
                                  size: 28,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              widget.project.title,
                              style: theme.textTheme.displaySmall?.copyWith(
                                fontSize: 28,
                                height: 1.1,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              widget.project.description,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurface.withValues(
                                  alpha: 0.68,
                                ),
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 24),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: widget.project.tags
                                  .take(3)
                                  .map((tag) => _buildTag(context, tag))
                                  .toList(),
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
        )
        .animate(delay: (100 * widget.index).ms)
        .fadeIn(duration: 800.ms, curve: Curves.easeOutQuad)
        .slideY(
          begin: 0.2,
          end: 0,
          duration: 800.ms,
          curve: Curves.easeOutBack,
        );
  }

  Widget _buildTag(BuildContext context, String tag) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        tag,
        style: theme.textTheme.labelLarge?.copyWith(
          fontSize: 11,
          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
    );
  }
}
