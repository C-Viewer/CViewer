import 'package:cviewer_frontend/assets/images/image_paths.dart';
import 'package:cviewer_frontend/constants/route_constants.dart';
import 'package:cviewer_frontend/domain/logic/auth/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _authManager = AuthManager();

  @override
  void initState()  {
    super.initState();
    _authManager.checkAccess();
  }

  ReactionDisposer _reactionBuilder(BuildContext context) {
    return reaction(
      (_) => _authManager.isAuthorized,
      (isAuthorized) {
        context.goNamed(
          isAuthorized ? RouteNames.main : RouteNames.auth,
        );
      },
      equals: (_, __) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: _reactionBuilder,
      child: Scaffold(
        body: Center(
          child: Image.asset(
            ImagePaths.logo,
          ),
        ),
      ),
    );
  }
}
