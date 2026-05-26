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

  static const String email = 'hello@oussama.dev';
  static const String github = 'https://github.com/oussama';
  static const String linkedin = 'https://linkedin.com/in/oussama';

  static const List<String> skills = [
    'Flutter',
    'Dart',
    'Firebase',
    'REST APIs',
    'GraphQL',
    'Riverpod',
    'Bloc',
    'Provider',
    'GetX',
    'Git & GitHub',
    'Figma',
    'Android',
    'iOS',
    'Flutter Web',
    'SQLite',
    'Hive',
    'Unit Testing',
    'Widget Testing',
    'CI/CD',
    'Push Notifications',
  ];

  static const List<Project> projects = [
    Project(
      title: 'E-Commerce App',
      description:
          'Full-featured shopping app with product catalog, cart management, order tracking, and Firebase authentication.',
      tags: ['Flutter', 'Firebase', 'Riverpod', 'Stripe'],
      githubUrl: 'https://github.com',
    ),
    Project(
      title: 'Task Manager',
      description:
          'Cross-platform productivity app with real-time sync, offline support, and team collaboration features.',
      tags: ['Flutter', 'Hive', 'Bloc', 'REST API'],
      githubUrl: 'https://github.com',
    ),
    Project(
      title: 'Chat Application',
      description:
          'Real-time messaging with media sharing, push notifications, and Firebase Cloud Messaging.',
      tags: ['Flutter', 'Firebase', 'Provider', 'FCM'],
      githubUrl: 'https://github.com',
    ),
    Project(
      title: 'Portfolio Website',
      description:
          'This portfolio, built entirely with Flutter Web — featuring smooth animations and responsive design.',
      tags: ['Flutter Web', 'Dart', 'Responsive'],
      githubUrl: 'https://github.com',
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
