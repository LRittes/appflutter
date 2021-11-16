import 'package:flutter/material.dart';
import 'package:ativ4/screens/Register/index.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de compras'),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
          actions: [
            IconButton(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 36),
              icon: const Icon(Icons.close),
              onPressed: () {},
            )
          ],
        ),
        body: Column(
          children: [
            Text('asdasdsad'),
            Text('asdasdsad'),
            Text('asdasdsad'),
            Text('asdasdsad'),
            Text('asdasdsad'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return const Register();
            }));
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.deepOrangeAccent,
        ));
  }
}
