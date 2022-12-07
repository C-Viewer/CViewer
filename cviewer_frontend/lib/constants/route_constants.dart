class RoutePaths {
  RoutePaths._();

  static const splash = '/splash';

  static const auth = '/auth';

  static const session = '/';
  static const main = 'main';
  static const cv = 'cv/:${RouteParams.cvId}';
}

class RouteNames {
  RouteNames._();

  static const auth = 'auth';
  static const main = 'main';
  static const cv = 'cv';
}

class RouteParams {
  RouteParams._();

  static const cvId = 'cv_id';
}
