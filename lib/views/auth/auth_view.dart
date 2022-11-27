import 'package:cloffer_mobile/services/auth/auth_provider.dart';
import 'package:cloffer_mobile/services/auth/http_auth_provider.dart';
import 'package:flutter/material.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<StatefulWidget> createState() => _AuthState();
}

class _AuthState extends State<AuthView> {
  late final TextEditingController _emailController;
  late final AuthProvider _authProvider;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _emailController = TextEditingController();
    _authProvider = HttpAuthProvider();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _LoginPage(
      emailController: _emailController,
      onTap: () async {
        _authProvider.sendEmailCode;
      },
      formKey: _formKey);
}

class _LoginPage extends StatelessWidget {
  const _LoginPage(
      {super.key,
      required this.emailController,
      required this.onTap,
      required this.formKey});

  final TextEditingController emailController;
  final VoidCallback onTap;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        body: Column(children: <Widget>[
          Container(
              decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: 580.0,
              padding: const EdgeInsets.all(20),
              child: Column(children: <Widget>[
                const Padding(
                    padding: EdgeInsets.fromLTRB(20, 120, 20, 40),
                    child: Image(
                        image: AssetImage('assets/logo_small.png'),
                        width: 125,
                        height: 50)),
                _buildForm(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: InkWell(
                    onTap: () {},
                    child: const Text(
                      'Хотите зарегистрировать заведение?',
                      style: TextStyle(
                          decoration: TextDecoration.none, color: Colors.blue),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Проблемы со входом',
                    style: TextStyle(
                        decoration: TextDecoration.none, color: Colors.blue),
                  ),
                )
              ])),
          const SizedBox(height: 8),
          Container(
              width: double.infinity,
              height: 172,
              decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
              child: Column(children: <Widget>[
                const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                    child: Text("Поддержка партнёров")),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    '+7 (923) 109 54 22',
                    style: TextStyle(
                        decoration: TextDecoration.none, color: Colors.orange),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'cloffer@work.ru',
                    style: TextStyle(
                        decoration: TextDecoration.none, color: Colors.orange),
                  ),
                ),
              ]))
        ]));
  }

  Widget _buildForm() => _MyCustomForm(
      onTap: onTap, formKey: formKey, emailController: emailController);
}

class _MyCustomForm extends StatelessWidget {
  const _MyCustomForm(
      {super.key,
      required this.emailController,
      required this.onTap,
      required this.formKey});

  final TextEditingController emailController;
  final VoidCallback onTap;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Электронная почта',
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(12, 23, 0, 22),
              ),
              controller: emailController,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
              child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(340, 50),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                child: const Text('Получить код'),
              ),
            ),
          ],
        ));
  }
}
