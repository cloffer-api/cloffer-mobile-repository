import 'package:cloffer_mobile/views/auth/auth_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Cloffer Connect';

    return MaterialApp(
        title: appTitle,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFF2C1811),
            secondary: const Color(0xFFFFC107),
          ),
        ),
        home: const AuthView());
  }
}
