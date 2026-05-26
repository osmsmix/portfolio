import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class NavBar extends StatefulWidget {
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onExperienceTap;
  final VoidCallback onContactTap;

  const NavBar({
    super.key,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onExperienceTap,
    required this.onContactTap,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _menuOpen = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xCC0D1117),
              border: Border(
                bottom: BorderSide(color: AppColors.border, width: 1),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 64,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        children: [
                          _Logo(),
                          const Spacer(),
                          if (isMobile)
                            IconButton(
                              icon: Icon(
                                _menuOpen ? Icons.close : Icons.menu,
                                color: AppColors.textPrimary,
                              ),
                              onPressed: () =>
                                  setState(() => _menuOpen = !_menuOpen),
                            )
                          else
                            _DesktopLinks(
                              onAboutTap: widget.onAboutTap,
                              onSkillsTap: widget.onSkillsTap,
                              onProjectsTap: widget.onProjectsTap,
                              onExperienceTap: widget.onExperienceTap,
                              onContactTap: widget.onContactTap,
                            ),
                        ],
                      ),
                    ),
                  ),
                  if (isMobile && _menuOpen)
                    _MobileMenu(
                      onItemTap: (cb) {
                        cb();
                        setState(() => _menuOpen = false);
                      },
                      onAboutTap: widget.onAboutTap,
                      onSkillsTap: widget.onSkillsTap,
                      onProjectsTap: widget.onProjectsTap,
                      onExperienceTap: widget.onExperienceTap,
                      onContactTap: widget.onContactTap,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'oussama',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          TextSpan(
            text: '.dev',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.accent,
            ),
          ),
        ],
      ),
    );
  }
}

class _DesktopLinks extends StatelessWidget {
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onExperienceTap;
  final VoidCallback onContactTap;

  const _DesktopLinks({
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onExperienceTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _NavLink(label: 'About', onTap: onAboutTap),
        _NavLink(label: 'Skills', onTap: onSkillsTap),
        _NavLink(label: 'Projects', onTap: onProjectsTap),
        _NavLink(label: 'Experience', onTap: onExperienceTap),
        _NavLink(label: 'Contact', onTap: onContactTap),
      ],
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavLink({required this.label, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 150),
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: _hovered ? AppColors.textPrimary : AppColors.textSecondary,
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  final Function(VoidCallback) onItemTap;
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onExperienceTap;
  final VoidCallback onContactTap;

  const _MobileMenu({
    required this.onItemTap,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onExperienceTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MobileItem(label: 'About', onTap: () => onItemTap(onAboutTap)),
          _MobileItem(label: 'Skills', onTap: () => onItemTap(onSkillsTap)),
          _MobileItem(label: 'Projects', onTap: () => onItemTap(onProjectsTap)),
          _MobileItem(
              label: 'Experience', onTap: () => onItemTap(onExperienceTap)),
          _MobileItem(label: 'Contact', onTap: () => onItemTap(onContactTap)),
        ],
      ),
    );
  }
}

class _MobileItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _MobileItem({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
