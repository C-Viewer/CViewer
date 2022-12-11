class RoutePaths {
  RoutePaths._();

  static const splash = '/splash';

  static const auth = '/auth';

  static const session = '/';
  static const main = '/main';
  static const cvHistory = '/cv/:${RouteParams.cvId}';
  static const cvCreator = '/create-cv';
}

class RouteNames {
  RouteNames._();

  static const auth = 'auth';
  static const session = 'session';
  static const main = 'main';
  static const cvHistory = 'cv-history';
  static const cvCreator = 'cv-creator';
}

class RouteParams {
  RouteParams._();

  static const cvId = 'cv_id';
}
