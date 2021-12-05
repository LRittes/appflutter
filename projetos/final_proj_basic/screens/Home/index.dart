import 'package:flutter/material.dart';
import 'package:ativ4/controllers/provider_items.dart';
import 'package:ativ4/models/card_item.dart';
import 'package:ativ4/screens/Register/index.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SnackBar snackBarDeleteAll = SnackBar(
    content: const Text(
      "Todos items deletados",
      style: TextStyle(fontSize: 18),
    ),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    duration: const Duration(seconds: 1),
    action: SnackBarAction(
      label: "Desfazer",
      onPressed: () {},
      textColor: Colors.black,
    ),
    backgroundColor: Colors.blueAccent,
  );

  @override
  Widget build(BuildContext context) {
    final Items provider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de compras',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 36),
            icon: const Icon(Icons.close),
            onPressed: () {
              setState(() {
                ScaffoldMessenger.of(context).showSnackBar(snackBarDeleteAll);
                provider.deleteAll();
              });
            },
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Flexible(
          child: list(),
        ),
      ),
      bottomSheet: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        color: Colors.deepOrangeAccent,
        child: Center(
          child: Text(
            'Valor total: R\$ ${provider.totValue}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
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

  Container list() {
    final Items provider = Provider.of(context);

    return Container(
      padding: const EdgeInsets.only(bottom: 60),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int i) {
          return CardItem(
            index: i,
            category: provider.items[i].category,
            title: provider.items[i].name,
            price: provider.items[i].value,
          );
        },
        itemCount: provider.count,
      ),
    );
  }
}
