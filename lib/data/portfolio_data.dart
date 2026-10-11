class Project {
  final String title;
  final String description;
  final List<String> tags;
  final String? githubUrl;
  final String? liveUrl;
  final String? appStoreUrl;
  final String? playStoreUrl;
  final bool inDevelopment;

  const Project({
    required this.title,
    required this.description,
    required this.tags,
    this.githubUrl,
    this.liveUrl,
    this.appStoreUrl,
    this.playStoreUrl,
    this.inDevelopment = false,
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
  static const String name = 'Oussama Mohamed El Hadi';
  static const String title = 'Flutter Developer';
  static const String tagline =
      'I build mobile apps and websites — and handle everything needed to get them live on the App Store and Google Play.';
  static const String bio =
      "I'm a Flutter developer based in Tunisia. I take projects from idea to published app — "
      "UI design, backend integration, and full store submission on both the App Store and Google Play. "
      "All my published apps are built and shipped solo.";

  static const String photoAsset = 'assets/images/oussama.jpg';

  static const String email = 'oussama.mohamedelhadi@gmail.com';
  static const String github = 'https://github.com/osmsmix';
  static const String linkedin = 'https://www.linkedin.com/in/oussama-mohamed-el-hadi-3b5344260';
  static const String upwork = 'https://www.upwork.com/freelancers/~01825ff64c8093996f?mp_source=share';
  static const String fiverr = 'https://www.fiverr.com/s/Vrrklkz';
  static const String mostaql = 'https://mostaql.com/u/oussama_elhadi';
  static const String? cvUrl = null;

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
      appStoreUrl: 'https://apps.apple.com/app/id6772883634',
      playStoreUrl: 'https://play.google.com/store/apps/details?id=engs.mauri.citat',
    ),
    Project(
      title: 'Madrasa',
      description:
          'School management platform connecting directors, teachers, and parents. Features bulletin boards, grade tracking, absence reports, timetables, and PDF generation. Trilingual (AR/FR/EN). Backend on Supabase.',
      tags: ['Flutter', 'Supabase', 'Provider', 'i18n', 'PDF'],
      appStoreUrl: 'https://apps.apple.com/tn/app/madrasa/id6815927815',
      liveUrl: 'https://inquisitive-froyo-19130a.netlify.app',
    ),
    Project(
      title: 'Pharmacy Platform',
      description:
          'A dual-app pharmacy platform: patients browse nearby pharmacies on a map and order medication, while pharmacists manage orders in real time. Features biometric login, push notifications, and geolocation.',
      tags: ['Flutter', 'Firebase', 'Flutter Map', 'Geolocator', 'i18n'],
      inDevelopment: true,
    ),
    Project(
      title: 'Taxi – Ride-Hailing',
      description:
          'A full ride-hailing platform with four roles: rider, driver, dispatcher, and owner. Drivers get live requests with TTS announcements and real-time tracking on Google Maps. Includes driver subscriptions and multi-language support.',
      tags: ['Flutter', 'Firebase', 'Google Maps', 'Real-time', 'i18n'],
      inDevelopment: true,
    ),
    Project(
      title: 'PetroTools',
      description:
          'Engineering toolkit for petroleum students. Features an IPR (Inflow Performance Relationship) calculator for computing AOF and productivity index from well test data, with interactive charts.',
      tags: ['Flutter', 'Dart', 'fl_chart', 'Engineering'],
      appStoreUrl: 'https://apps.apple.com/tn/app/petrotools/id6792877304',
    ),
    Project(
      title: 'Portfolio Website',
      description:
          'This portfolio, built with Flutter Web — scroll-triggered animations, typewriter effect, responsive layout, and a dark minimal aesthetic.',
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
      year: '2026',
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
