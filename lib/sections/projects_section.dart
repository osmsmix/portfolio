import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import '../widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 80 : 120),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionTitle(label: 'Projects'),
                const SizedBox(height: 16),
                Text(
                  "What I've Built",
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: isMobile ? 32 : 40,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(height: 48),
                if (isMobile)
                  Column(
                    children: [
                      for (int i = 0; i < PortfolioData.projects.length; i++) ...[
                        if (i > 0) const SizedBox(height: 24),
                        _ProjectCard(
                          project: PortfolioData.projects[i],
                          delay: (i * 100).ms,
                        ),
                      ],
                    ],
                  )
                else
                  const _ProjectGrid(projects: PortfolioData.projects),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Desktop 2-column grid with auto height using LayoutBuilder + two Columns
class _ProjectGrid extends StatelessWidget {
  final List<Project> projects;

  const _ProjectGrid({required this.projects});

  @override
  Widget build(BuildContext context) {
    final left = <Project>[];
    final right = <Project>[];
    for (var i = 0; i < projects.length; i++) {
      (i.isEven ? left : right).add(projects[i]);
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              for (var i = 0; i < left.length; i++) ...[
                if (i > 0) const SizedBox(height: 24),
                _ProjectCard(project: left[i], delay: ((i * 2) * 100).ms),
              ],
            ],
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            children: [
              for (var i = 0; i < right.length; i++) ...[
                if (i > 0) const SizedBox(height: 24),
                _ProjectCard(project: right[i], delay: ((i * 2 + 1) * 100).ms),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Project project;
  final Duration delay;

  const _ProjectCard({required this.project, required this.delay});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    final hasStoreLinks = p.appStoreUrl != null || p.playStoreUrl != null;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.card : AppColors.surface,
          border: Border.all(
            color: _hovered ? const Color(0x6600D4AA) : AppColors.border,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: _hovered
              ? [
                  const BoxShadow(
                    color: Color(0x0D00D4AA),
                    blurRadius: 32,
                    offset: Offset(0, 8),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top row: folder icon + action links
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.folder_outlined,
                    color: AppColors.accent, size: 32),
                Row(
                  children: [
                    if (p.inDevelopment)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0x26F0AD00),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'In Development',
                          style: GoogleFonts.firaCode(
                            fontSize: 11,
                            color: const Color(0xFFF0AD00),
                          ),
                        ),
                      ),
                    if (p.githubUrl != null) ...[
                      const SizedBox(width: 4),
                      _IconBtn(
                        icon: Icons.code_rounded,
                        tooltip: 'Repository',
                        onTap: () => _open(p.githubUrl!),
                      ),
                    ],
                    if (p.liveUrl != null) ...[
                      const SizedBox(width: 4),
                      _IconBtn(
                        icon: Icons.open_in_new_rounded,
                        tooltip: 'Live demo',
                        onTap: () => _open(p.liveUrl!),
                      ),
                    ],
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Title
            Text(
              p.title,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            // Description
            Text(
              p.description,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.65,
              ),
            ),
            const SizedBox(height: 16),
            // Tech tags
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: p.tags.map((tag) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0x1A00D4AA),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    tag,
                    style: GoogleFonts.firaCode(
                      fontSize: 12,
                      color: AppColors.accent,
                    ),
                  ),
                );
              }).toList(),
            ),
            // Store badges
            if (hasStoreLinks) ...[
              const SizedBox(height: 20),
              const Divider(color: AppColors.border, height: 1),
              const SizedBox(height: 16),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  if (p.appStoreUrl != null)
                    _StoreBadge(
                      label: 'App Store',
                      icon: Icons.phone_iphone,
                      onTap: () => _open(p.appStoreUrl!),
                    ),
                  if (p.playStoreUrl != null)
                    _StoreBadge(
                      label: 'Google Play',
                      icon: Icons.android,
                      onTap: () => _open(p.playStoreUrl!),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(delay: widget.delay, duration: 600.ms)
        .slideY(
          begin: 0.08,
          end: 0,
          delay: widget.delay,
          duration: 600.ms,
          curve: Curves.easeOut,
        );
  }
}

class _IconBtn extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const _IconBtn({required this.icon, required this.tooltip, required this.onTap});

  @override
  State<_IconBtn> createState() => _IconBtnState();
}

class _IconBtnState extends State<_IconBtn> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Icon(
              widget.icon,
              size: 18,
              color: _hovered ? AppColors.textPrimary : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

class _StoreBadge extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _StoreBadge({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_StoreBadge> createState() => _StoreBadgeState();
}

class _StoreBadgeState extends State<_StoreBadge> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: _hovered
                ? const Color(0x3300D4AA)
                : const Color(0x1A00D4AA),
            border: Border.all(
              color: _hovered
                  ? AppColors.accent
                  : const Color(0x4000D4AA),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, size: 15, color: AppColors.accent),
              const SizedBox(width: 6),
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.accent,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.open_in_new_rounded,
                  size: 12, color: AppColors.accent),
            ],
          ),
        ),
      ),
    );
  }
}
