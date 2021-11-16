import 'package:ativ4/models/item.dart';
import 'package:flutter/material.dart';

class RegisterController {
  List<Item> items = [];

  TextEditingController boxItems = TextEditingController();

  void registerSave() {
    String registredItem = boxItems.text;
    print(registredItem);
  }
}
