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

class JourneyStep {
  final String year;
  final String title;
  final List<String> details;

  const JourneyStep({
    required this.year,
    required this.title,
    required this.details,
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

  static const List<JourneyStep> journey = [
    JourneyStep(
      year: '2023',
      title: 'Discovered Flutter',
      details: [
        'Self-taught Flutter and Dart entirely through YouTube — no bootcamp, no course.',
        'Started building small apps to practice while studying Petroleum Engineering.',
      ],
    ),
    JourneyStep(
      year: '2024',
      title: 'Built Mauri-Citat',
      details: [
        'Designed and developed a full-stack football pitch booking app from scratch.',
        'Integrated Supabase, Firebase, interactive maps, push notifications, and trilingual support.',
      ],
    ),
    JourneyStep(
      year: '2025',
      title: 'Shipped on Both Stores',
      details: [
        'Published Mauri-Citat on the App Store and Google Play — fully solo.',
        'Handled everything: architecture, UI, backend, deployment, and store submissions.',
      ],
    ),
    JourneyStep(
      year: 'Now',
      title: 'Building More',
      details: [
        'Actively looking for Flutter projects and collaborations.',
        'Turning ideas into polished, production-ready apps.',
      ],
    ),
  ];
}
