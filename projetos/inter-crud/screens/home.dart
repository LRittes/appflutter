import 'package:ativ4/controllers/home_controller.dart';
import 'package:ativ4/repositorys/banco_de_dados.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loading = true;
  HomeController controller = HomeController();

  carregar() {
    setState(() {
      loading = true;
    });
    controller.buscarPessoas().whenComplete(() {
      setState(() {
        loading = false;
      });
    });
  }

  cadastrar() {
    setState(() {
      loading = true;
    });
    controller.cadastrar().whenComplete(carregar);
  }

  remover(int i) {
    setState(() {
      loading = true;
    });
    controller.remover(i).whenComplete(carregar);
  }

  @override
  void initState() {
    super.initState();
    BancoDeDados().openDb().whenComplete(carregar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD"),
        centerTitle: true,
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Row(
                      children: const [
                        Text("Nome:"),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      controller: controller.nomePessoa,
                      decoration:
                          const InputDecoration(hintText: "Ex: Leandro"),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      child: const Text("Salvar"),
                      onPressed: cadastrar,
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  Flexible(
                    flex: 7,
                    child: controller.pessoas.isEmpty
                        ? const Center(child: Text("Lista vazia"))
                        : _list(),
                  ),
                ],
              ),
            ),
    );
  }

  _list() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(controller.pessoas[index].name!),
          trailing: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                remover(index);
              }),
        );
      },
      itemCount: controller.pessoas.length,
    );
  }
}
