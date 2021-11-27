import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  SharedPreferences? sharedPreferences;
  Home({Key? key}) : super(key: key) {
    SharedPreferences.getInstance().then((value) => sharedPreferences = value);
  }

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ImagePicker imagePicker = ImagePicker();

  Future<String> encode(XFile image) async {
    var bytes = await image.readAsBytes();
    String result = base64.encode(bytes);
    return result;
  }

  Image? decode(String? image) {
    var bytes = base64.decode(image!);
    Image result = Image.memory(bytes);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    Image? image = //widget.sharedPreferences != null
        // ?
        decode(
      widget.sharedPreferences!.getString('img'),
    );
    // : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Colocando image'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: image ??
              const Text(
                'Insira uma imagem',
                style: TextStyle(fontSize: 22),
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          imagePicker
              .pickImage(
                source: ImageSource.camera,
                imageQuality: 25,
              )
              .then(
                (XFile? value) => {
                  encode(value!).then((bytes) => {
                        setState(() {
                          widget.sharedPreferences!.setString('img', bytes);
                        })
                      })
                },
              );
        },
      ),
    );
  }
}
