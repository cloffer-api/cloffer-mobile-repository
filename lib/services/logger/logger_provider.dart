import 'package:logger/logger.dart';

class LoggerProvider {
  LoggerProvider._internal();
  static final LoggerProvider _instance = LoggerProvider._internal();
  factory LoggerProvider() {
    return _instance;
  }
  final _logger = Logger();
  Logger get logger => _logger;
}
