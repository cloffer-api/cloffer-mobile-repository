import 'package:flutter_secure_storage/flutter_secure_storage.dart' as storage;

class TokenProvider {
  TokenProvider._internal();
  static final TokenProvider _instance = TokenProvider._internal();
  factory TokenProvider() {
    return _instance;
  }
  final _storage = const storage.FlutterSecureStorage();

  Future<void> store({required String token}) async =>
      await _storage.write(key: 'token', value: token);

  Future<String?> get token async => await _storage.read(key: 'token');
}
