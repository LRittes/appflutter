import 'package:ativ4/screens/Tela2/tela_2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Colocando image'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Tirar foto'),
          onPressed: () {
            imagePicker.pickImage(source: ImageSource.camera).then(
                  (XFile? value) => {
                    value!.readAsBytes().then((bytes) => {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return Tela2(
                              bytes: bytes,
                            );
                          }))
                        })
                  },
                );
          },
        ),
      ),
    );
  }
}
