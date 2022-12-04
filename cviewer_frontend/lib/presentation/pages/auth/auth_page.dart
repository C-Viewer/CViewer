import 'package:cviewer_frontend/constants/route_constants.dart';
import 'package:cviewer_frontend/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// TODO: intl
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Вход в CViewer',
              textAlign: TextAlign.center,
              style: TextStyles.titleXXL,
            ),
            const SizedBox(height: 48),
            // Email field
            TextFormField(
              decoration: InputDecoration(
                label: Text(
                  'Почта',
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Password field
            TextFormField(
              decoration: InputDecoration(
                label: Text(
                  'Пароль',
                ),
              ),
            ),
            const SizedBox(height: 48),
            // TODO: login check
            ElevatedButton(
              onPressed: () => context.replaceNamed(RouteNames.main),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Войти',
                  style: TextStyles.titleL,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
