import 'package:ativ4/controllers/provider_items.dart';
import 'package:ativ4/screens/Home/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (ctx) => Items(),
        child: const MaterialApp(
          title: "Projeto final",
          home: Home(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
