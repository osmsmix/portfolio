import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import '../widgets/section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 80 : 120),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                const SectionTitle(label: "Let's Talk"),
                const SizedBox(height: 24),
                Text(
                  'Get In Touch',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: isMobile ? 32 : 48,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    letterSpacing: -1,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  "I'm open to new opportunities. Whether you have a project idea, "
                  "a question, or just want to say hi — my inbox is always open.",
                  style: GoogleFonts.inter(
                    fontSize: 17,
                    color: AppColors.textSecondary,
                    height: 1.7,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 44),
                _PrimaryButton(
                  label: 'Send an Email',
                  onTap: () => _open('mailto:${PortfolioData.email}'),
                ),
                const SizedBox(height: 16),
                _CopyEmailButton(),
                const SizedBox(height: 48),
                // Freelance platforms
                Text(
                  'Or hire me on',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: AppColors.textMuted,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _PlatformButton(
                      label: 'Upwork',
                      color: const Color(0xFF6FDA44),
                      onTap: () => _open(PortfolioData.upwork),
                    ),
                    _PlatformButton(
                      label: 'Fiverr',
                      color: const Color(0xFF1DBF73),
                      onTap: () => _open(PortfolioData.fiverr),
                    ),
                    _PlatformButton(
                      label: 'Mostaql',
                      color: const Color(0xFF2EB6E1),
                      onTap: () => _open(PortfolioData.mostaql),
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _SocialLink(
                      label: 'GitHub',
                      icon: Icons.code_rounded,
                      onTap: () => _open(PortfolioData.github),
                    ),
                    const SizedBox(width: 36),
                    _SocialLink(
                      label: 'LinkedIn',
                      icon: Icons.person_outline_rounded,
                      onTap: () => _open(PortfolioData.linkedin),
                    ),
                    const SizedBox(width: 36),
                    _SocialLink(
                      label: 'Email',
                      icon: Icons.mail_outline_rounded,
                      onTap: () => _open('mailto:${PortfolioData.email}'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 700.ms)
        .slideY(begin: 0.05, end: 0, duration: 700.ms, curve: Curves.easeOut);
  }
}

class _PrimaryButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _PrimaryButton({required this.label, required this.onTap});

  @override
  State<_PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<_PrimaryButton> {
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
          padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 18),
          decoration: BoxDecoration(
            color: _hovered ? const Color(0xFF00BFA0) : AppColors.accent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: _hovered
                ? [
                    const BoxShadow(
                      color: Color(0x4D00D4AA),
                      blurRadius: 28,
                      offset: Offset(0, 8),
                    ),
                  ]
                : [],
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialLink extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _SocialLink({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_SocialLink> createState() => _SocialLinkState();
}

class _SocialLinkState extends State<_SocialLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 150),
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color:
                _hovered ? AppColors.textPrimary : AppColors.textSecondary,
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                size: 16,
                color: _hovered
                    ? AppColors.textPrimary
                    : AppColors.textSecondary,
              ),
              const SizedBox(width: 6),
              Text(widget.label),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlatformButton extends StatefulWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _PlatformButton({
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  State<_PlatformButton> createState() => _PlatformButtonState();
}

class _PlatformButtonState extends State<_PlatformButton> {
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
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            color: _hovered ? widget.color : Colors.transparent,
            border: Border.all(color: widget.color, width: 1.5),
            borderRadius: BorderRadius.circular(8),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: widget.color.withAlpha(60),
                      blurRadius: 20,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : [],
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: _hovered ? Colors.black : widget.color,
            ),
          ),
        ),
      ),
    );
  }
}

class _CopyEmailButton extends StatefulWidget {
  @override
  State<_CopyEmailButton> createState() => _CopyEmailButtonState();
}

class _CopyEmailButtonState extends State<_CopyEmailButton> {
  bool _copied = false;

  Future<void> _copy() async {
    await Clipboard.setData(const ClipboardData(text: PortfolioData.email));
    setState(() => _copied = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _copied = false);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _copy,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: GoogleFonts.firaCode(
            fontSize: 14,
            color: _copied ? AppColors.accent : AppColors.textMuted,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _copied ? Icons.check_rounded : Icons.copy_rounded,
                size: 14,
                color: _copied ? AppColors.accent : AppColors.textMuted,
              ),
              const SizedBox(width: 8),
              Text(_copied ? 'Copied!' : PortfolioData.email),
            ],
          ),
        ),
      ),
    );
  }
}
