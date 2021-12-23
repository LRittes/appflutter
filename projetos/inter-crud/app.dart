import 'package:ativ4/screens/home.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
      title: "Exercicio 8",
      debugShowCheckedModeBanner: false,
    );
  }
}
