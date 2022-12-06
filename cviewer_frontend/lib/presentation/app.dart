import 'package:cviewer_frontend/constants/route_constants.dart';
import 'package:cviewer_frontend/presentation/pages/auth/auth_page.dart';
import 'package:cviewer_frontend/presentation/pages/session/cv/cv_page.dart';
import 'package:cviewer_frontend/presentation/pages/session/main/main_page.dart';
import 'package:cviewer_frontend/presentation/pages/session/session_page.dart';
import 'package:cviewer_frontend/presentation/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CViewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _appRouter,
    );
  }
}

final _appRouter = GoRouter(
  initialLocation: RoutePaths.splash,
  routes: [
    // Splash
    GoRoute(
      path: RoutePaths.splash,
      builder: (_, __) => const SplashPage(),
    ),
    // Auth
    GoRoute(
      path: RoutePaths.auth,
      name: RouteNames.auth,
      builder: (_, __) => const AuthPage(),
    ),
    // Session
    GoRoute(
      path: RoutePaths.session,
      builder: (_, __) => const SessionPage(),
      routes: [
        // Main
        GoRoute(
          path: RoutePaths.main,
          name: RouteNames.main,
          builder: (_, __) => const MainPage(),
        ),
        // Resume
        GoRoute(
          path: RoutePaths.resume,
          name: RouteNames.resume,
          builder: (_, s) => CVPage(
            cvId: int.parse(s.params[RouteParams.resumeId]!),
          ),
        ),
      ],
    ),
  ],
);