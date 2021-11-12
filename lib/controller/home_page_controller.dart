import 'package:ativ4/models/tarefas.dart';
import 'package:flutter/material.dart';

class HomePageController {
  List<Tarefa> tarefas = [
    Tarefa(tarefa: "Correr"),
  ];

  TextEditingController boxTarefas = TextEditingController();

  void contactSave() {
    String tarefaFromBox = boxTarefas.text;

    boxTarefas.clear();

    Tarefa newTarefa = Tarefa(tarefa: tarefaFromBox);

    tarefas.add(newTarefa);
  }
}
