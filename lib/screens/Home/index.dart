import 'package:ativ4/controllers/controller.dart';
import 'package:ativ4/controllers/list_items.dart';
import 'package:ativ4/models/card_item.dart';
import 'package:flutter/material.dart';
import 'package:ativ4/screens/Register/index.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  RegisterController controller = RegisterController();

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
            onPressed: () {
              setState(() {
                print(items);
              });
            },
          )
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: list(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
            return const Register();
          }));
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }

  ListView list() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int i) {
        return CardItem(
          category: items[i].category,
          title: items[i].name,
          price: items[i].value,
        );
      },
      itemCount: items.length,
    );
  }
}
