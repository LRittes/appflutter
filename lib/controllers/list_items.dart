import 'package:ativ4/models/item.dart';
import 'package:flutter/cupertino.dart';

class Items extends ChangeNotifier {
  List<Item> items = [];

  List categories = ['Alimento', 'Bebida', 'Higiene', 'Limpeza'];

  void registerSave(boxCategory, boxName, boxPrice) {
    String registredCategory = boxCategory;
    String registredName = boxName.text;
    String registredPrice = boxPrice.text;
    boxName.clear();
    boxPrice.clear();

    Item newItem = Item(
      category: registredCategory,
      name: registredName,
      value: registredPrice,
    );

    items.add(newItem);
  }

  deleteItem(int i) {
    items.removeAt(i);
    notifyListeners();
  }

  int get count {
    return items.length;
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
