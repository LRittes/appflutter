import 'package:ativ4/models/filme.dart';
import 'package:ativ4/repositorys/filmes_repositorys.dart';
import 'package:flutter/material.dart';

class RegisterMovieController {
  List<Filme> filmes = [];
  FilmesRepositorys repository = FilmesRepositorys();
  TextEditingController movieName = TextEditingController();
  TextEditingController movieDuration = TextEditingController();
  TextEditingController movieSinopse = TextEditingController();
  TextEditingController movieIs18 = TextEditingController();

  Future<void> searchMovie() async {
    await repository.selectAll().then((value) => filmes = value);
  }

  Future<void> registerMovie(name, sinopse, time, m18) async {
    Filme movie =
        Filme(name: name, sinopse: sinopse, duracaoMinutos: time, maior18: m18);
    movieName.clear();
    movieSinopse.clear();
    movieDuration.clear();
    await repository.insert(movie);
  }

  Future<void> deleteMovie(int i) async {
    Filme movie = filmes[i];
    await repository.delete(movie);
  }
}
