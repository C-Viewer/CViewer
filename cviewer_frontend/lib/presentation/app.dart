import 'package:cviewer_frontend/data/repositories/mock_user_repository.dart';
import 'package:cviewer_frontend/presentation/route_paths.dart';
import 'package:cviewer_frontend/presentation/screens/main_screen.dart';
import 'package:cviewer_frontend/presentation/screens/resume/applicant_resume_screen.dart';
import 'package:cviewer_frontend/presentation/widgets/user/user_provider.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      user: mockUser,
      child: MaterialApp(
        title: 'CViewer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          RoutePaths.main: (_) => const MainScreen(),
          RoutePaths.applicantReview: (_) => const ApplicantResumeScreen(),
        },
      ),
    );
  }
}
