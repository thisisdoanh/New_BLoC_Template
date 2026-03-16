class UrlEndPoint {
  static const _AuthEndPoint auth = _AuthEndPoint();
}

class _AuthEndPoint {
  const _AuthEndPoint();

  final String _authPath = '/auth';

  String get login => '$_authPath/login';

  String get signUp => '$_authPath/signup';

  String get refreshToken => '$_authPath/refresh_token';
}
