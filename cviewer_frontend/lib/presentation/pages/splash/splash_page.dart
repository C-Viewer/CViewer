import 'package:cviewer_frontend/constants/route_constants.dart';
import 'package:cviewer_frontend/presentation/resources/text_styles.dart';
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
  void initState() {
    super.initState();
    _authManager.checkAccess();
  }

  ReactionDisposer _reactionBuilder(BuildContext context) {
    return reaction(
      (_) => _authManager.isAuthorized,
      (isAuthorized) {
        context.replaceNamed(
          isAuthorized ? RouteNames.main : RouteNames.auth,
        );
      },
      equals: (_, __) => false,
    );
  }

  @override
  // TODO: добавить лого
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: _reactionBuilder,
      child: const Scaffold(
        body: Center(
          child: Text(
            'CViewer',
            style: TextStyles.titleXXL,
          ),
        ),
      ),
    );
  }
}
