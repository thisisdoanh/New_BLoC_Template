abstract class LoginResponse {
  String? get id;
  String? get email;
  String? get accessToken;
  String? get refreshToken;
  List<String>? get roles;
}
