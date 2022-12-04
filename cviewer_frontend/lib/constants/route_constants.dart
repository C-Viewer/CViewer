class RoutePaths {
  RoutePaths._();

  static const splash = '/splash';

  static const auth = '/auth';

  static const session = '/';
  static const main = 'main';
  static const resume = 'resume/:${RouteParams.resumeId}';
}

class RouteNames {
  RouteNames._();

  static const auth = 'auth';
  static const main = 'main';
  static const resume = 'resume';
}

class RouteParams {
  RouteParams._();

  static const resumeId = 'resume_id';
}
