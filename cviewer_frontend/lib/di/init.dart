import 'package:cviewer_frontend/di/init.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@injectableInit
void initDI(String env) {
  GetIt.instance.init(
    environment: env,
  );
}
