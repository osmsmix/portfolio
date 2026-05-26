import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import '../widgets/section_title.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 80 : 120),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionTitle(label: 'Skills'),
                const SizedBox(height: 16),
                Text(
                  'Technologies & Tools',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: isMobile ? 32 : 40,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(height: 48),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: PortfolioData.skills.asMap().entries.map((entry) {
                    return _SkillChip(
                      label: entry.value,
                      delay: (entry.key * 40).ms,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SkillChip extends StatefulWidget {
  final String label;
  final Duration delay;

  const _SkillChip({required this.label, required this.delay});

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.basic,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: _hovered ? const Color(0x1A00D4AA) : Colors.transparent,
          border: Border.all(
            color: _hovered ? AppColors.accent : AppColors.border,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          widget.label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: _hovered ? AppColors.accent : AppColors.textSecondary,
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(delay: widget.delay, duration: 500.ms)
        .scale(
          begin: const Offset(0.95, 0.95),
          end: const Offset(1, 1),
          delay: widget.delay,
          duration: 500.ms,
          curve: Curves.easeOut,
        );
  }
}
