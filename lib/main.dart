import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF2C1811),
          secondary: const Color(0xFFFFC107),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
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
                Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Электронная почта',
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(12, 23, 0, 22),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                          child: ElevatedButton(
                            onPressed: () {},
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
                    )),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Future<void> _getRequest() async {
    var url = Uri.https('fd6b-188-162-14-186.eu.ngrok.io', '/api/v1/hard_test');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getRequest,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
