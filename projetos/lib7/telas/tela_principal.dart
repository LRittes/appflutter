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
        return ThemeIcon(
          text: controller.tarefas[i].tarefa,
        );
      },
      itemCount: controller.tarefas.length,
    );
  }
}

class ThemeIcon extends StatefulWidget {
  final String? text;
  const ThemeIcon({Key? key, this.text}) : super(key: key);

  @override
  _ThemeIconState createState() => _ThemeIconState();
}

class _ThemeIconState extends State<ThemeIcon> {
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
      decoration: BoxDecoration(
          border:
              Border.all(color: click ? Colors.green : Colors.red, width: 2)),
      child: InkWell(
        onTap: () {
          setState(() {
            click = !click;
          });
        },
        child: ListTile(
          title: Text(
            widget.text!,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          trailing: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: click ? Colors.green : Colors.red, width: 3),
              shape: BoxShape.circle,
            ),
            child: Icon(
              click ? Icons.check : Icons.close,
              size: 40,
              color: click ? Colors.green : Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
