import 'dart:convert';

import 'package:http/http.dart' as http;

import 'network_config.dart' as config;

class HttpService {
  HttpService._internal();

  static final HttpService _instance = HttpService._internal();

  factory HttpService() => _instance;

  final _routeTag = config.routeTag;
  final _baseUrl = config.baseUrl;

  Uri _getUri(String route) => Uri.https(_baseUrl, _routeTag + route);

  Future<http.Response> get(
          {String route = '', Map<String, String>? headers}) async =>
      http.get(_getUri(route), headers: headers);

  Future<http.Response> post(
      {String route = '',
      Map<String, String>? headers = const {
        'Content-Type': 'application/json',
      },
      Object? body}) async {
    if (headers?['Content-Type'] == 'application/json') {
      body = jsonEncode(body);
    }
    return http.post(_getUri(route), headers: headers, body: body);
  }
}
