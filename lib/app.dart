import 'package:ativ4/screens/Home/index.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Projeto final",
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
