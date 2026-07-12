import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import '../widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 80 : 120),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _AboutText(),
                      const SizedBox(height: 48),
                      _StatsGrid(),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 5, child: _AboutText()),
                      const SizedBox(width: 80),
                      Expanded(flex: 4, child: _StatsGrid()),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _AboutText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(label: 'About Me'),
        const SizedBox(height: 24),
        Text(
          PortfolioData.name,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            height: 1.1,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          PortfolioData.bio,
          style: GoogleFonts.inter(
            fontSize: 17,
            color: AppColors.textSecondary,
            height: 1.8,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "When I'm not shipping apps, I'm exploring new design trends, contributing to open source, or experimenting with the latest Flutter features.",
          style: GoogleFonts.inter(
            fontSize: 17,
            color: AppColors.textSecondary,
            height: 1.8,
          ),
        ),
      ],
    )
        .animate()
        .fadeIn(duration: 700.ms)
        .slideX(begin: -0.04, end: 0, duration: 700.ms, curve: Curves.easeOut);
  }
}

class _StatsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const cards = [
      _ValueCard(icon: Icons.phone_iphone_rounded, label: 'iOS & Android', sub: 'Cross-platform apps'),
      _ValueCard(icon: Icons.route_rounded, label: 'End-to-End', sub: 'From UI to store'),
      _ValueCard(icon: Icons.self_improvement_rounded, label: 'Self-Taught', sub: 'YouTube → Production'),
      _ValueCard(icon: Icons.handshake_rounded, label: 'Open to Work', sub: 'Freelance & projects'),
      _ValueCard(icon: Icons.rocket_launch_rounded, label: 'App Publishing', sub: 'I\'ll publish your app on App Store & Play Store'),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = (constraints.maxWidth - 16) / 2;
        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: cards
              .map((card) => SizedBox(width: cardWidth, child: card))
              .toList(),
        );
      },
    )
        .animate()
        .fadeIn(delay: 200.ms, duration: 700.ms)
        .slideX(
          begin: 0.04,
          end: 0,
          delay: 200.ms,
          duration: 700.ms,
          curve: Curves.easeOut,
        );
  }
}

class _ValueCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String sub;

  const _ValueCard({required this.icon, required this.label, required this.sub});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.accent, size: 26),
          const SizedBox(height: 12),
          Text(
            label,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            sub,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
