import 'package:ativ4/controllers/controller.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterController controller = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
              TextField(
                controller: controller.boxItems,
                decoration: const InputDecoration(
                    hintText: 'ex: bebida...',
                    hintStyle: TextStyle(fontSize: 22)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: const Text(
                  'Nome:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
              ),
              TextField(
                controller: controller.boxItems,
                decoration: const InputDecoration(
                    hintText: 'ex: banana...',
                    hintStyle: TextStyle(fontSize: 22)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: const Text(
                  'Preço',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
              ),
              TextField(
                controller: controller.boxItems,
                decoration: const InputDecoration(
                    hintText: 'ex: R\$ 9,90',
                    hintStyle: TextStyle(fontSize: 22)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      controller.registerSave();
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
