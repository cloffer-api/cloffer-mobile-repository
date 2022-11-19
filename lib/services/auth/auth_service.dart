import 'package:cloffer_mobile/services/auth/auth_provider.dart';

class AuthService implements AuthProvider {
  final AuthProvider _provider;
  AuthService(this._provider);
  @override
  Future<String> login({required String email, required String code}) async =>
      _provider.login(email: email, code: code);

  @override
  Future<void> sendEmailCode({required String email}) =>
      _provider.sendEmailCode(email: email);
}
