import 'package:cviewer_frontend/assets/strings/l10n.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).home),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text(
          'Home',
        ),
      ),
    );
  }
}
