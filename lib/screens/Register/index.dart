import 'package:ativ4/controllers/list_items.dart';
import 'package:ativ4/screens/Home/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  NameController controllerName = NameController();
  PriceController controllerPrice = PriceController();
  String? valueItem;

  @override
  Widget build(BuildContext context) {
    final Items provider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
              return const Home();
            }));
          },
        ),
        title: const Text('Cadastrar item'),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Categoria',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
              DropdownButton(
                  isExpanded: true,
                  value: valueItem,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  onChanged: (String? newValue) {
                    setState(() {
                      valueItem = newValue!;
                    });
                  },
                  items: provider.categories
                      .map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList()),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  'Nome:',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                ),
              ),
              TextField(
                controller: controllerName.fieldName,
                decoration: const InputDecoration(
                    hintText: 'ex: banana...',
                    hintStyle: TextStyle(fontSize: 22)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  'Preço',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                ),
              ),
              TextField(
                controller: controllerPrice.fieldPrice,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'ex: R\$ 9,90',
                    hintStyle: TextStyle(fontSize: 22)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      provider.registerSave(
                        valueItem,
                        controllerName.fieldName,
                        controllerPrice.fieldPrice,
                      );
                    });
                  },
                  child: const Text(
                    'Salvar',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepOrangeAccent),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
