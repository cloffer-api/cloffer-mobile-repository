abstract class AuthProvider {
  Future<String> login({required String email, required String code});
  Future<String> sendEmailCode({required String email});
}
