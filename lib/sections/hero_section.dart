import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import '../widgets/typewriter_text.dart';

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
                child: isMobile
                    ? _HeroContentMobile(
                        onProjectsTap: onProjectsTap,
                        onContactTap: onContactTap,
                      )
                    : _HeroContentDesktop(
                        onProjectsTap: onProjectsTap,
                        onContactTap: onContactTap,
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

class _HeroContentDesktop extends StatelessWidget {
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const _HeroContentDesktop({
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: _HeroText(
            onProjectsTap: onProjectsTap,
            onContactTap: onContactTap,
            isMobile: false,
          ),
        ),
        const SizedBox(width: 64),
        const Expanded(
          flex: 4,
          child: Center(child: _AvatarWidget(size: 300)),
        ),
      ],
    );
  }
}

class _HeroContentMobile extends StatelessWidget {
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const _HeroContentMobile({
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(child: _AvatarWidget(size: 120)),
        const SizedBox(height: 32),
        _HeroText(
          onProjectsTap: onProjectsTap,
          onContactTap: onContactTap,
          isMobile: true,
        ),
      ],
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  final double size;

  const _AvatarWidget({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Color(0xFF00D4AA), Color(0xFF0088AA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x5500D4AA),
            blurRadius: size * 0.3,
            spreadRadius: size * 0.02,
          ),
        ],
      ),
      padding: const EdgeInsets.all(3),
      child: ClipOval(
        child: PortfolioData.photoAsset != null
            ? Image.asset(
                PortfolioData.photoAsset!,
                fit: BoxFit.cover,
              )
            : Container(
                color: AppColors.surface,
                child: Center(
                  child: Text(
                    'OM',
                    style: TextStyle(
                      fontSize: size * 0.28,
                      fontWeight: FontWeight.w800,
                      color: AppColors.accent,
                      letterSpacing: size * 0.01,
                    ),
                  ),
                ),
              ),
      ),
    )
        .animate()
        .fadeIn(delay: 400.ms, duration: 800.ms)
        .scale(
          begin: const Offset(0.85, 0.85),
          end: const Offset(1, 1),
          delay: 400.ms,
          duration: 800.ms,
          curve: Curves.easeOut,
        );
  }
}

class _HeroText extends StatelessWidget {
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;
  final bool isMobile;

  const _HeroText({
    required this.onProjectsTap,
    required this.onContactTap,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
        ).animate().fadeIn(delay: 100.ms, duration: 600.ms),
        const SizedBox(height: 14),
        Text(
          "Hi, I'm\nOussama\nMohamed El Hadi.",
          style: GoogleFonts.spaceGrotesk(
            fontSize: isMobile ? 44 : 64,
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
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: TypewriterText(
            text: PortfolioData.tagline,
            startDelay: const Duration(milliseconds: 900),
            style: GoogleFonts.inter(
              fontSize: isMobile ? 17 : 18,
              color: AppColors.textSecondary,
              height: 1.7,
            ),
          ),
        ).animate().fadeIn(delay: 500.ms, duration: 400.ms),
        const SizedBox(height: 32),
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
            if (PortfolioData.cvUrl != null)
              _HeroButton(
                label: 'Download CV',
                isPrimary: false,
                onTap: () async {
                  final uri = Uri.parse(PortfolioData.cvUrl!);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri,
                        mode: LaunchMode.externalApplication);
                  }
                },
              ),
          ],
        ).animate().fadeIn(delay: 700.ms, duration: 600.ms),
      ],
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
