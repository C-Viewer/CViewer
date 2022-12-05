import 'package:cviewer_frontend/constants/route_constants.dart';
import 'package:cviewer_frontend/constants/text_styles.dart';
import 'package:cviewer_frontend/domain/logic/auth/auth_manager.dart';
import 'package:cviewer_frontend/domain/models/profile/profile_credentials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';

// TODO: intl
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _authManager = AuthManager();

  ReactionDisposer _reactionBuilder(BuildContext context) {
    return reaction(
      (_) => _authManager.isAuthorized,
      (isAuthorized) {
        if (isAuthorized) {
          context.replaceNamed(RouteNames.main);
        }
      },
    );
  }

  void _onSignInButtonPressed() {
    _authManager.signIn(
      credentials: ProfileCredentials(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: _reactionBuilder,
      child: Scaffold(
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
                controller: _emailTextController,
                decoration: InputDecoration(
                  label: Text(
                    'Почта',
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Password field
              TextFormField(
                controller: _passwordTextController,
                obscureText: true,
                decoration: InputDecoration(
                  label: Text(
                    'Пароль',
                  ),
                ),
              ),
              const SizedBox(height: 48),
              // TODO: login check
              ElevatedButton(
                onPressed: _onSignInButtonPressed,
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
      ),
    );
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }
}
