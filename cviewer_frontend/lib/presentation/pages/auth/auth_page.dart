import 'package:cviewer_frontend/assets/images/image_paths.dart';
import 'package:cviewer_frontend/assets/strings/l10n.dart';
import 'package:cviewer_frontend/constants/route_constants.dart';
import 'package:cviewer_frontend/domain/logic/auth/auth_manager.dart';
import 'package:cviewer_frontend/domain/models/profile/profile_credentials.dart';
import 'package:cviewer_frontend/presentation/resources/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';

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
          context.goNamed(RouteNames.main);
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
              // Logo
              Center(
                child: Image.asset(
                  ImagePaths.logo,
                ),
              ),
              // Title
              Text(
                S.of(context).authTitle,
                textAlign: TextAlign.center,
                style: TextStyles.titleXXL,
              ),
              const SizedBox(height: 48),
              // Email field
              TextFormField(
                controller: _emailTextController,
                decoration: InputDecoration(
                  label: Text(
                    S.of(context).email,
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
                    S.of(context).password,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: _onSignInButtonPressed,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    S.of(context).signIn,
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
