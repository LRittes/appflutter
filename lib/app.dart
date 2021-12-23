import 'package:ativ4/screens/home.dart';
import 'package:flutter/material.dart';

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
