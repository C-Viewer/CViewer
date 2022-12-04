import 'package:cviewer_frontend/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DI {
  DI._();

  static late final SharedPreferences storage;

  static Future<void> init(String env) => _initDI(env);
}

@injectableInit
Future<void> _initDI(String env) async {
  DI.storage = await SharedPreferences.getInstance();

  GetIt.instance.init(
    environment: env,
  );
}
