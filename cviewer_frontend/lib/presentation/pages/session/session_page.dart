import 'package:cviewer_frontend/domain/logic/auth/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SessionPage extends StatefulWidget {
  const SessionPage({super.key});

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  final _authManager = AuthManager();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => _authManager,
    );
  }
}
