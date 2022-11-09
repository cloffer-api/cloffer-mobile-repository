import 'package:http/http.dart' as http;

import 'network_config.dart' as config;

class HttpService {
  HttpService._internal();

  static final HttpService _instance = HttpService._internal();

  factory HttpService() {
    return _instance;
  }

  final _baseUrl = config.baseUrl;

  Uri _getUri(String route) => Uri.https(_baseUrl, route);

  Future<http.Response> get(
          {String route = '', Map<String, String>? headers}) async =>
      await http.get(_getUri(route), headers: headers);

  Future<http.Response> post(
          {String route = '',
          Map<String, String>? headers,
          Map<String, String>? body}) async =>
      await http.post(_getUri(route), headers: headers, body: body);
}
