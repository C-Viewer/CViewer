import 'package:cviewer_frontend/constants/route_constants.dart';
import 'package:cviewer_frontend/domain/logic/auth/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class SessionPage extends StatefulWidget {
  const SessionPage({super.key});

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  final _authManager = AuthManager();

// TODO: remove?
  ReactionDisposer _reactionBuilder(BuildContext context) {
    return reaction(
      (_) => _authManager.isAuthorized,
      (isAuthorized) {
        if (!isAuthorized) {
          context.replaceNamed(RouteNames.auth);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: _reactionBuilder,
      child: Provider(
        create: (_) => _authManager,
      ),
    );
  }
}
