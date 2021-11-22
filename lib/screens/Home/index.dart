import 'package:flutter/material.dart';
import 'package:ativ4/controllers/list_items.dart';
import 'package:ativ4/models/card_item.dart';
import 'package:ativ4/screens/Register/index.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final Items provider = Provider.of(context);
    var listItem = provider.items.toList().isNotEmpty
        ? provider.items.map((e) => double.parse(e.value!))
        : null;
    var valorTotalInt = listItem != null
        ? listItem.reduce((prev, nxt) => prev + nxt).toStringAsFixed(2)
        : 0.0;
    String tot = valorTotalInt.toString().replaceFirst('.', ',');

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
                provider.deleteAll();
              });
            },
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Flexible(
          child: SizedBox(
            width: double.infinity,
            child: list(),
          ),
        ),
      ),
      bottomSheet: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        color: Colors.deepOrangeAccent,
        child: Center(
          child: Text(
            'Valor total: R\$ $tot',
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
