import 'package:cviewer_frontend/assets/strings/l10n.dart';
import 'package:cviewer_frontend/constants/route_constants.dart';
import 'package:cviewer_frontend/presentation/pages/auth/auth_page.dart';
import 'package:cviewer_frontend/presentation/pages/session/cv/cv_page.dart';
import 'package:cviewer_frontend/presentation/pages/session/main/main_page.dart';
import 'package:cviewer_frontend/presentation/pages/session/session_page.dart';
import 'package:cviewer_frontend/presentation/pages/splash/splash_page.dart';
import 'package:cviewer_frontend/presentation/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: appTheme,
      routerConfig: _appRouter,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
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
        // CV
        GoRoute(
          path: RoutePaths.cv,
          name: RouteNames.cv,
          builder: (_, s) => CVPage(
            cvId: int.parse(s.params[RouteParams.cvId]!),
          ),
        ),
      ],
    ),
  ],
);
