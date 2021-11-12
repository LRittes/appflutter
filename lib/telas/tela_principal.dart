import 'package:ativ4/controller/home_page_controller.dart';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  HomePageController controller = HomePageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lista de Tarefas",
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: TextField(
              controller: controller.boxTarefas,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Tarefa",
              ),
            ),
          ),
          SizedBox(
            child: Center(
              child: ElevatedButton(
                child: const Text('salvar'),
                onPressed: () {
                  setState(() {
                    controller.contactSave();
                  });
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 50),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
          ),
          const Divider(
            thickness: 5,
          ),
          Flexible(
            child: SizedBox(
              height: 500,
              width: 400,
              child: _list(),
            ),
          )
        ],
      ),
    );
  }

  ListView _list() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int i) {
        return TarefaWidget(index:i);
      },
      itemCount: controller.tarefas.length,
    );
  }
}

class TarefaWidget extends StatefulWidget {
  final int? index;
  TarefaWidget({Key? key, this.index}) : super(key: key);

  @override
  _TarefaWidgetState createState() => _TarefaWidgetState();
}

class _TarefaWidgetState extends State<TarefaWidget> {
  HomePageController controller = HomePageController();

  @override
  Widget build(BuildContext context) {
  bool click = true;
  int w = 0;
    return Container(
    margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
    decoration:
        BoxDecoration(border: Border.all(color: Colors.black38, width: 2)),
    child: InkWell(
      onTap: () {
        setState(() {
          click = !click;
          w += 1;
        });
        print(click);
        print(w);
      },
      child: ListTile(
        title: Text(
          controller.tarefas[i].tarefa!,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        trailing: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 3),
            shape: BoxShape.circle,
          ),
          child: Icon(
            click ? Icons.check : Icons.close,
            size: 40,
            color: click ? Colors.green : Colors.red,
          ),
        ),
      ),
    ),);

// Container tarefaMethod
//   );
// }
