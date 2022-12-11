import 'package:logging/logging.dart';

class Loggers {
  Loggers._();

  // Repositories
  static final authRepository = Logger('AUTH REPO');

  // Business logic
  static final authManager = Logger('AUTH MANAGER');
  static final cvsLoader = Logger('CVs LOADER');
  static final cvHistoryLoader = Logger('CV HISTORY LOADER');
  static final cvCreator = Logger('CV CREATOR');
  static final profileLoader = Logger('PROFILE LOADER');
}
