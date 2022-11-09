import 'package:cloffer_mobile/features/auth/services/auth/auth_provider.dart';
import 'package:cloffer_mobile/network/http_service.dart' as http;

class HttpAuthProvider implements AuthProvider {
  final httpService = http.HttpService();

  @override
  Future<String> login({required String email, required String code}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<String> sendEmailCode({required String email}) async {
    var response = await httpService
        .post(route: '/auth_request_admin', body: {'email': email});
    return '1';
  }
}
