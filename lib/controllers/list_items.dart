import 'package:ativ4/models/item.dart';
import 'package:flutter/cupertino.dart';

class Items extends ChangeNotifier {
  List<Item> items = [
    Item(
      category: 'registredCategory',
      name: 'registredName',
      value: 'registredPrice',
    )
  ];

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

  deleteItem(int i) {
    items.removeAt(i);
    notifyListeners();
  }

  int get count {
    return items.length;
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
