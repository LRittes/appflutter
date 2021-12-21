import 'package:ativ4/modelos/pessoa.dart';
import 'package:ativ4/repositorys/banco_de_dados.dart';

class PessoaRepository {
  final String sqlSelectAll = 'SELECT * FROM pessoas';
  final String sqlInsert = 'INSERT INTO pessoas (name) VALUES (?)';
  final String sqlUpdate = 'UPDATE pessoas SET name = ? WHERE id = ?';
  final String sqlDelete = 'DELETE FROM pessoas WHERE id = ?';

  Future<List<Pessoa>> selectAll() async {
    List<Pessoa> pessoas = [];

    List<Map<String, Object?>>? json =
        await BancoDeDados().db!.rawQuery(sqlSelectAll);

    for (Map<String, Object?> element in json) {
      Pessoa newPerson = Pessoa.fromMap(element);
      pessoas.add(newPerson);
    }

    return pessoas;
  }

  Future<void> insert(Pessoa pessoa) async {
    await BancoDeDados().db!.rawQuery(sqlInsert,[pessoa.name]);
  }

  Future<void> update(Pessoa pessoa) async {
    await BancoDeDados().db!.rawUpdate(sqlUpdate,[pessoa.name,pessoa.id]);
  }
  Future<void> delete(Pessoa pessoa) async {
    await BancoDeDados().db!.rawDelete(sqlDelete,[pessoa.id]);
  }
}
