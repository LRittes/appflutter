import 'package:ativ4/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "atividade 8",
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
