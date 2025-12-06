import 'package:eiga_learn/navigators/AppNavigator.dart';
import 'package:eiga_learn/srceens/mainScreen.dart';
import 'package:eiga_learn/srceens/settingsScreen.dart';
import 'package:eiga_learn/srceens/videoScreen.dart';
import 'package:eiga_learn/srceens/vocabularyScreen.dart';
import 'package:go_router/go_router.dart';

final GoRouter AppRouter = GoRouter(
  initialLocation: '/main',
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppNavigator(child: child),
      routes: [
        GoRoute(path: '/main', builder: (context, state) => const MainScreen()),
        GoRoute(path: '/vocabulary', builder: (context, state) => const VocabularyScreen()),
        GoRoute(path: '/settings', builder: (context, state) => const SettingsScreen()),
      ],
    ),
    GoRoute(path: '/video', builder: (context, state) => const VideoScreen()),
  ],
);
