// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cloffer_mobile/services/auth/http_auth_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final authProvider = HttpAuthProvider();
  const email = 'mi.morgun.ivan@mail.ru';
  test('Request test', () async {
    var sendEmailCode = await authProvider.sendEmailCode(email: email);
  });
  test('Send code', () async {
    const code = '0126';
    var sendCode = await authProvider.login(email: email, code: code);
  });
}
