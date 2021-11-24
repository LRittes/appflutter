import 'dart:typed_data';

import 'package:flutter/material.dart';

class Tela2 extends StatelessWidget {
  const Tela2({Key? key, this.bytes}) : super(key: key);

  final Uint8List? bytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Image.memory(bytes!),
      ),
    );
  }
}
