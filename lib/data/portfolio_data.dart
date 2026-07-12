class Project {
  final String title;
  final String description;
  final List<String> tags;
  final String? githubUrl;
  final String? liveUrl;

  const Project({
    required this.title,
    required this.description,
    required this.tags,
    this.githubUrl,
    this.liveUrl,
  });
}

class Experience {
  final String role;
  final String company;
  final String period;
  final List<String> highlights;

  const Experience({
    required this.role,
    required this.company,
    required this.period,
    required this.highlights,
  });
}

class PortfolioData {
  static const String name = 'Oussama Mohamed';
  static const String title = 'Flutter Developer';
  static const String tagline =
      'I build beautiful, performant cross-platform apps for mobile and web.';
  static const String bio =
      "I'm a Flutter developer passionate about crafting elegant experiences. "
      "I care deeply about clean architecture, smooth animations, and intuitive UX "
      "that makes complex products feel effortless.";

  static const String email = 'oussama.mohamedelhadi@gmail.com';
  static const String github = 'https://github.com/osmsmix';
  static const String linkedin = 'https://www.linkedin.com/in/oussama-mohamed-el-hadi-3b5344260';

  static const List<String> skills = [
    'Flutter',
    'Dart',
    'Supabase',
    'Firebase',
    'REST APIs',
    'Provider',
    'Riverpod',
    'Bloc',
    'Flutter Map',
    'Geolocator',
    'Git & GitHub',
    'Figma',
    'Android',
    'iOS',
    'Flutter Web',
    'SQLite',
    'Hive',
    'Push Notifications',
    'Localizations (i18n)',
    'CI/CD',
  ];

  static const List<Project> projects = [
    Project(
      title: 'Mauri-Citat',
      description:
          'Football pitch booking app for Mauritania. Players browse pitches on an interactive map, check availability, and book by time slot. Owners manage reservations in real time. Trilingual (AR/FR/EN).',
      tags: ['Flutter', 'Supabase', 'Firebase', 'Flutter Map', 'Provider'],
      liveUrl: 'https://osmsmix.github.io/mauri-citat/',
    ),
    Project(
      title: 'Portfolio Website',
      description:
          'This portfolio, built entirely with Flutter Web — featuring smooth animations, responsive design, and a dark minimal aesthetic.',
      tags: ['Flutter Web', 'Dart', 'Responsive'],
      githubUrl: 'https://github.com/osmsmix/portfolio',
      liveUrl: 'https://osmsmix.github.io/portfolio/',
    ),
  ];

  static const List<Experience> experiences = [
    Experience(
      role: 'Flutter Developer',
      company: 'Tech Company',
      period: '2023 — Present',
      highlights: [
        'Shipped 3 production apps with 10k+ active users',
        'Reduced app startup time by 35% through lazy loading and code splitting',
        'Mentored junior developers on Flutter architecture and best practices',
      ],
    ),
    Experience(
      role: 'Mobile Developer Intern',
      company: 'Startup',
      period: '2022 — 2023',
      highlights: [
        'Built pixel-perfect UI components from Figma designs using Flutter',
        'Integrated REST APIs and managed state with Provider',
        'Participated in agile ceremonies and weekly code reviews',
      ],
    ),
  ];
}
