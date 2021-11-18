import 'package:ativ4/controllers/list_items.dart';
import 'package:ativ4/models/item.dart';
import 'package:flutter/material.dart';

class RegisterController extends Items {
  Items listItems = Items();

  void registerSave(fieldCategory, fieldName, fieldPrice) {
    String registredCategory = fieldCategory;
    String registredName = fieldName.text;
    String registredPrice = fieldPrice.text;
    fieldCategory.clear();
    fieldName.clear();
    fieldPrice.clear();

    Item newItem = Item(
      category: registredCategory,
      name: registredName,
      value: registredPrice,
    );

    listItems.items.add(newItem);
  }
}

class CategoryController {
  final TextEditingController _boxCategory = TextEditingController();
  String get fieldCategory {
    return _boxCategory.text;
  }

  set fieldName(_) {
    _boxCategory.text = '';
  }
}

class NameController {
  final TextEditingController _boxName = TextEditingController();
  get fieldName {
    return _boxName.text;
  }

  set fieldName(_) {
    _boxName.text = '';
  }
}

class PriceController {
  final TextEditingController _boxPrice = TextEditingController();
  get fieldPrice {
    return _boxPrice.text;
  }

  set fieldName(_) {
    _boxPrice.text = '';
  }
}
