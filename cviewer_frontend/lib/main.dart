import 'dart:async';

import 'package:cviewer_frontend/di/init.dart';
import 'package:cviewer_frontend/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

void main() {
  initDI(Environment.dev);
  runZonedGuarded(
    () => runApp(const App()),
    (e, st) => debugPrint('ERROR: $e\nStacktrace:\n$st'),
  );
}
