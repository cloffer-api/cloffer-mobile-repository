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
        home: loginPage());
  }

  Widget loginPage() {
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
                MyCustomForm(onTap: () {  },),
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
}

class MyCustomForm extends StatelessWidget {
  MyCustomForm({super.key, required this.onTap});

  final Function() onTap;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
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
