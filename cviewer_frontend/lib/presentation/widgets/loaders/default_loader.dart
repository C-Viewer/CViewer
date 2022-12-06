import 'package:flutter/material.dart';

class DefaultLoader extends StatelessWidget {
  const DefaultLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
