import 'dart:convert';
import 'package:flutter/material.dart';

class Tela2 extends StatelessWidget {
  const Tela2({Key? key, this.bytes}) : super(key: key);

  final String? bytes;

  @override
  Widget build(BuildContext context) {
    Image decode(String image) {
      var bytes = base64.decode(image);
      Image result = Image.memory(bytes);
      return result;
    }

    Image? _image = decode(bytes!);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela 2'),
        centerTitle: true,
      ),
      body: Center(
        child: _image ?? Container(),
      ),
    );
  }
}
