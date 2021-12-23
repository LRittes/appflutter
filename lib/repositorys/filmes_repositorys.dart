import 'package:ativ4/models/filme.dart';
import 'package:ativ4/repositorys/bando_de_dados.dart';

class FilmesRepositorys {
  final String sqlSelectAll = 'SELECT * FROM filmes';
  final String sqlInsert =
      'INSERT INTO filmes (name,sinopse,duracaoMinutos,maior18) VALUES (?,?,?,?)';
  final String sqlUpdate =
      'UPDATE filmes SET name = ?, sinopse = ?, duracaoMinutos = ?, maior18 = ? WHERE id = ?';
  final String sqlDelete = 'DELETE FROM filmes WHERE id = ?';

  Future<List<Filme>> selectAll() async {
    List<Filme> filmes = [];

    List<Map<String, Object?>>? json =
        await BancoDeDados().db!.rawQuery(sqlSelectAll);

    for (Map<String, Object?> element in json) {
      Filme newFilm = Filme.fromMap(element);
      filmes.add(newFilm);
    }
    return filmes;
  }

  Future<void> insert(Filme filme) async {
    await BancoDeDados().db!.rawQuery(sqlSelectAll,
        [filme.name, filme.sinopse, filme.duracaoMinutos, filme.maior18]);
  }

  Future<void> update(Filme filme) async {
    await BancoDeDados().db!.rawUpdate(sqlUpdate, [
      filme.name,
      filme.sinopse,
      filme.duracaoMinutos,
      filme.maior18,
      filme.id
    ]);
  }

  Future<void> delete(Filme filme) async {
    await BancoDeDados().db!.rawDelete(sqlDelete, [filme.id]);
  }
}
