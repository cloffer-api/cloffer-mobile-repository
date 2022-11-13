import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:cloffer_mobile/exceptions/auth/auth_exceptions.dart';
import 'package:cloffer_mobile/exceptions/general_exceptions.dart';
import 'package:cloffer_mobile/network/http_service.dart' as http;
import 'package:cloffer_mobile/network/network_config.dart' as config;

import 'auth_provider.dart';

class HttpAuthProvider implements AuthProvider {
  final httpService = http.HttpService();

  @override
  Future<String> login({required String email, required String code}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> sendEmailCode({required String email}) async {
    try {
      var response = await httpService
          .post(route: config.sendEmailCodeRoute, body: {'email': email});
      var message = await jsonDecode(response.body);
      switch (response.statusCode) {
        case HttpStatus.accepted:
          {
            developer.log(message, name: 'auth_provider.sendEmailCode.success');
          }
          break;
        case HttpStatus.notFound:
          {
            developer.log(message,
                name: 'auth_provider.sendEmailCode.notFound');
            throw NoAdminWithSuchEmailFoundException();
          }
        case HttpStatus.unprocessableEntity:
          {
            developer.log(message,
                name: 'auth_provider.sendEmailCode.invalidEmail');
            throw InvalidEmailException();
          }
        case HttpStatus.internalServerError:
          {
            developer.log(message,
                name: 'auth_provider.sendEmailCode.notFound');
            throw ServerInternalException();
          }
      }
    } on SocketException catch (e) {}
  }
}
