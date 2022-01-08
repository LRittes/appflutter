import 'package:flutter/material.dart';
import 'package:test/screens/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CRUD Filmes",
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
