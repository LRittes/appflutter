import 'package:flutter/material.dart';
import 'package:test/controllers/register_movie_controller.dart';

class RegisterMovie extends StatefulWidget {
  const RegisterMovie({Key? key}) : super(key: key);

  @override
  _RegisterMovieState createState() => _RegisterMovieState();
}

class _RegisterMovieState extends State<RegisterMovie> {
  RegisterMovieController controller = RegisterMovieController();
  bool _val = false;
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

  register(name, sinopse, time, m18) {
    setState(() {
      loading = true;
    });
    controller.registerMovie(name, sinopse, time, m18).whenComplete(carregar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar Filme"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Titulo:",
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: controller.movieName,
              decoration:
                  const InputDecoration(hintText: "Ex: Harry Potter..."),
            ),
            const Text(
              "Sinopse:",
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: controller.movieSinopse,
              decoration: const InputDecoration(
                hintText: "Ex: Harry Potter...",
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const Text(
              "Duração:",
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: controller.movieDuration,
              decoration: const InputDecoration(hintText: "Em minutos"),
              keyboardType: TextInputType.number,
            ),
            const Text(
              "Maior de 18:",
              style: TextStyle(fontSize: 20),
            ),
            Row(
              children: [
                Row(children: [
                  const Text("Sim"),
                  Radio(
                    value: true,
                    groupValue: _val,
                    onChanged: (_) {
                      setState(() {
                        _val = true;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                ]),
                Row(children: [
                  const Text("Não"),
                  Radio(
                    value: false,
                    groupValue: _val,
                    onChanged: (_) {
                      setState(() {
                        _val = false;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                ]),
              ],
            ),
            Center(
              child: ElevatedButton(
                child: const Text("Salvar", style: TextStyle(fontSize: 18)),
                onPressed: () => register(
                  controller.movieName.text,
                  controller.movieSinopse.text,
                  controller.movieDuration.text.toString(),
                  _val,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
