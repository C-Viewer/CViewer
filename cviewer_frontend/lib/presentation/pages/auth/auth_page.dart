import 'package:cviewer_frontend/constants/route_constants.dart';
import 'package:cviewer_frontend/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Label
          const Text(
            'Кто вы?',
            textAlign: TextAlign.center,
            style: TextStyles.titleXXL,
          ),
          const SizedBox(height: 40),
          // Button
          TextButton(
            onPressed: () => context.replaceNamed(
              RouteNames.main,
              params: {
                RouteParams.userType: 'applicant',
              },
            ),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Соискатель',
                style: TextStyles.titleL,
              ),
            ),
          ),
          // Button
          TextButton(
            onPressed: () => context.replaceNamed(
              RouteNames.main,
              params: {
                RouteParams.userType: 'expert',
              },
            ),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Эксперт',
                style: TextStyles.titleL,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
