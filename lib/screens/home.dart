import 'package:ativ4/controllers/register_movie_controller.dart';
import 'package:ativ4/repositorys/bando_de_dados.dart';
import 'package:ativ4/screens/register_movie.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  RegisterMovieController controller = RegisterMovieController();
  bool loading = true;

  carregar() {
    setState(() {
      loading = true;
    });
    controller.searchMovie().whenComplete(() {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    BancoDeDados().openDB().whenComplete(carregar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filmes"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Flexible(
            child: controller.filmes.isEmpty
                ? const Center(child: Text("Lista vazia"))
                : ListView.builder(
                    itemBuilder: (BuildContext context, int i) {
                      return ListTile(
                        title: Text(controller.filmes[i].name!),
                        subtitle: Text(controller.filmes[i].sinopse!),
                      );
                    },
                  ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return const RegisterMovie();
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
