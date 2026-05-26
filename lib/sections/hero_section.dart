import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const HeroSection({
    super.key,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return Container(
      width: double.infinity,
      height: size.height,
      color: AppColors.bg,
      child: Stack(
        children: [
          const Positioned.fill(child: _HeroBackground()),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: isMobile ? 96 : 64,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '< Flutter Developer />',
                      style: GoogleFonts.firaCode(
                        fontSize: 13,
                        color: AppColors.accent,
                        letterSpacing: 0.5,
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 100.ms, duration: 600.ms),
                    const SizedBox(height: 20),
                    Text(
                      "Hi, I'm\nOussama\nMohamed.",
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: isMobile ? 52 : 84,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                        height: 1.0,
                        letterSpacing: -3,
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 300.ms, duration: 700.ms)
                        .slideY(
                          begin: 0.15,
                          end: 0,
                          delay: 300.ms,
                          duration: 700.ms,
                          curve: Curves.easeOut,
                        ),
                    const SizedBox(height: 28),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 540),
                      child: Text(
                        PortfolioData.tagline,
                        style: GoogleFonts.inter(
                          fontSize: isMobile ? 17 : 19,
                          color: AppColors.textSecondary,
                          height: 1.7,
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 500.ms, duration: 600.ms),
                    const SizedBox(height: 44),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        _HeroButton(
                          label: 'View My Work',
                          isPrimary: true,
                          onTap: onProjectsTap,
                        ),
                        _HeroButton(
                          label: 'Get In Touch',
                          isPrimary: false,
                          onTap: onContactTap,
                        ),
                      ],
                    ).animate().fadeIn(delay: 700.ms, duration: 600.ms),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: const _ScrollIndicator()
                .animate(onPlay: (c) => c.repeat(reverse: true))
                .moveY(
                  begin: 0,
                  end: 6,
                  duration: 1200.ms,
                  curve: Curves.easeInOut,
                ),
          ),
        ],
      ),
    );
  }
}

class _HeroBackground extends StatelessWidget {
  const _HeroBackground();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(painter: _GridPainter()),
        Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(-0.6, -0.4),
              radius: 1.4,
              colors: [
                Color(0x1200D4AA),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0x2521262D)
      ..strokeWidth = 0.5;

    const spacing = 72.0;
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _HeroButton extends StatefulWidget {
  final String label;
  final bool isPrimary;
  final VoidCallback onTap;

  const _HeroButton({
    required this.label,
    required this.isPrimary,
    required this.onTap,
  });

  @override
  State<_HeroButton> createState() => _HeroButtonState();
}

class _HeroButtonState extends State<_HeroButton> {
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
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? (_hovered
                    ? const Color(0xFF00BFA0)
                    : AppColors.accent)
                : Colors.transparent,
            border: Border.all(
              color: widget.isPrimary
                  ? AppColors.accent
                  : (_hovered ? AppColors.textSecondary : AppColors.border),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: widget.isPrimary && _hovered
                ? const [
                    BoxShadow(
                      color: Color(0x4000D4AA),
                      blurRadius: 20,
                      offset: Offset(0, 6),
                    ),
                  ]
                : const [],
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: widget.isPrimary
                  ? Colors.black
                  : (_hovered
                      ? AppColors.textPrimary
                      : AppColors.textSecondary),
            ),
          ),
        ),
      ),
    );
  }
}

class _ScrollIndicator extends StatelessWidget {
  const _ScrollIndicator();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'scroll',
          style: GoogleFonts.inter(
            fontSize: 10,
            letterSpacing: 2.5,
            color: AppColors.textMuted,
          ),
        ),
        const SizedBox(height: 6),
        const Icon(Icons.keyboard_arrow_down,
            color: AppColors.textMuted, size: 18),
      ],
    );
  }
}
