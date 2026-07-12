import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';

class SocialSidebar extends StatelessWidget {
  const SocialSidebar({super.key});

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 900) return const SizedBox.shrink();

    return Positioned(
      left: 24,
      bottom: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _SideIcon(
            icon: Icons.code_rounded,
            tooltip: 'GitHub',
            onTap: () => _open(PortfolioData.github),
          ),
          const SizedBox(height: 20),
          _SideIcon(
            icon: Icons.person_outline_rounded,
            tooltip: 'LinkedIn',
            onTap: () => _open(PortfolioData.linkedin),
          ),
          const SizedBox(height: 20),
          _SideIcon(
            icon: Icons.mail_outline_rounded,
            tooltip: 'Email',
            onTap: () => _open('mailto:${PortfolioData.email}'),
          ),
          const SizedBox(height: 20),
          Container(width: 1, height: 80, color: AppColors.textMuted),
        ],
      ),
    )
        .animate()
        .fadeIn(delay: 1200.ms, duration: 700.ms)
        .slideX(begin: -0.5, end: 0, delay: 1200.ms, duration: 700.ms);
  }
}

class _SideIcon extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const _SideIcon({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  @override
  State<_SideIcon> createState() => _SideIconState();
}

class _SideIconState extends State<_SideIcon> {
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
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            transform: Matrix4.translationValues(
                _hovered ? -3 : 0, 0, 0),
            child: Icon(
              widget.icon,
              size: 20,
              color: _hovered ? AppColors.accent : AppColors.textMuted,
            ),
          ),
        ),
      ),
    );
  }
}
