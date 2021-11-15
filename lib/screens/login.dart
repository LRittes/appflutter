import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Outra Tela"),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text(
            "Logout",
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            SnackBar snackBar = const SnackBar(
              content: Text(
                "Você foi desconectado",
              ),
              duration: Duration(seconds: 1),
              backgroundColor: Colors.indigoAccent,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(primary: Colors.indigoAccent),
        ),
      ),
    );
  }
}
