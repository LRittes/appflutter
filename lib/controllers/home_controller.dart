import 'package:ativ4/modelos/pessoa.dart';
import 'package:ativ4/repositorys/pessoa_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  List<Pessoa> pessoas = [];
  TextEditingController nomePessoa = TextEditingController();
  PessoaRepository repository = PessoaRepository();

  Future<void> buscarPessoas() async {
    await repository.selectAll().then((value) => pessoas = value);
  }

  Future<void> cadastrar() async {
    Pessoa pessoa = Pessoa(name: nomePessoa.text);
    nomePessoa.clear();
    await repository.insert(pessoa);
  }

  Future<void> remover(int i) async {
    Pessoa pessoa = pessoas[i];
    await repository.delete(pessoa);
  }
}
