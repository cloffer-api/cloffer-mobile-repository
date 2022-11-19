import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloffer_mobile/exceptions/auth/auth_exceptions.dart';
import 'package:cloffer_mobile/exceptions/general_exceptions.dart';
import 'package:cloffer_mobile/network/http_service.dart' as http;
import 'package:cloffer_mobile/network/routes/auth/auth_routes.dart' as routes;
import 'package:cloffer_mobile/services/logger/logger_provider.dart';

import 'auth_provider.dart';

class HttpAuthProvider implements AuthProvider {
  final _httpService = http.HttpService();
  final _logger = LoggerProvider().logger;

  @override
  Future<String> login({required String email, required String code}) async {
    try {
      var response = await _httpService
          .post(route: routes.loginRoute, body: {'email': email, 'code': code});
      var data = await jsonDecode(response.body);

      switch (response.statusCode) {
        case HttpStatus.ok:
          {
            return data['token'];
          }
        case HttpStatus.unprocessableEntity:
          {
            _logger.e(data['description']);
            throw WrongCodeAuthException();
          }
        case HttpStatus.notFound:
          {
            _logger.e(data['description']);
            throw NoAdminWithSuchEmailFoundException();
          }
        case HttpStatus.internalServerError:
          {
            _logger.e(data['description']);
            throw ServerInternalException();
          }
        default:
          throw Exception('Unprocessed exception');
      }
    } on SocketException catch (e) {
      _logger.e(e.message);
      throw GenericException();
    }
  }

  @override
  Future<void> sendEmailCode({required String email}) async {
    try {
      var response = await _httpService
          .post(route: routes.sendEmailCodeRoute, body: {'email': email});
      var data = await jsonDecode(response.body);
      var message = await data['description'];
      switch (response.statusCode) {
        case HttpStatus.accepted:
          {
            _logger.d(message);
          }
          break;
        case HttpStatus.notFound:
          {
            _logger.e(message);
            throw NoAdminWithSuchEmailFoundException();
          }
        case HttpStatus.unprocessableEntity:
          {
            _logger.e(message);
            throw InvalidEmailException();
          }
        case HttpStatus.internalServerError:
          {
            _logger.e(message);
            throw ServerInternalException();
          }
        default:
          throw Exception('Unprocessed exception');
      }
    } on SocketException catch (e) {
      _logger.e(e.message);
      throw GenericException();
    }
  }
}
