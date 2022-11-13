abstract class AuthProvider {
  Future<String> login({required String email, required String code});
  Future<void> sendEmailCode({required String email});
}
