import 'package:ativ4/controllers/list_items.dart';
import 'package:ativ4/models/item.dart';
import 'package:flutter/material.dart';

class RegisterController {
  void registerSave(boxCategory, boxName, boxPrice) {
    String registredCategory = boxCategory.text;
    String registredName = boxName.text;
    String registredPrice = boxPrice.text;
    boxCategory.clear();
    boxName.clear();
    boxPrice.clear();

    Item newItem = Item(
      category: registredCategory,
      name: registredName,
      value: registredPrice,
    );

    items.add(newItem);
  }
}

class CategoryController {
  TextEditingController boxCategory = TextEditingController();
  get fieldCategory {
    return boxCategory;
  }
}

class NameController {
  TextEditingController boxName = TextEditingController();
  get fieldName {
    return boxName;
  }
}

class PriceController {
  TextEditingController boxPrice = TextEditingController();
  get fieldPrice {
    return boxPrice;
  }
}
