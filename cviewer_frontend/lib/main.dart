import 'dart:async';

import 'package:cviewer_frontend/di/di.dart';
import 'package:cviewer_frontend/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

void main() async {
  await DI.init(Environment.dev);

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: ${record.message}');
  });

  runZonedGuarded(
    () => runApp(const App()),
    (e, st) => debugPrint('ERROR: $e\nStacktrace:\n$st'),
  );
}
