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
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.4,
      children: const [
        _StatCard(number: '3+', label: 'Years Experience'),
        _StatCard(number: '20+', label: 'Apps Shipped'),
        _StatCard(number: '10k+', label: 'Users Reached'),
        _StatCard(number: '∞', label: 'Lines of Dart'),
      ],
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

class _StatCard extends StatelessWidget {
  final String number;
  final String label;

  const _StatCard({required this.number, required this.label});

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
          Text(
            number,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: AppColors.accent,
              height: 1,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
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
