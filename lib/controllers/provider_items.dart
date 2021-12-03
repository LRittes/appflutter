import 'package:ativ4/models/item.dart';
import 'package:flutter/cupertino.dart';

class Items extends ChangeNotifier {
  List<Item> items = [
    Item(category: 'Alimento', name: "queijo", value: '25,00'),
    Item(category: 'Bebida', name: 'suco', value: '24,99'),
    Item(category: 'Limpeza', name: 'papel', value: '20,10'),
    Item(category: 'Higiene', name: 'sufite', value: '5,01'),
  ];

  List categories = ['Alimento', 'Bebida', 'Higiene', 'Limpeza'];

  List imgCard = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6TeiWp-y_jxH9camU-9AQoyMJkkfGYGdLwQ&usqp=CAU',
    'https://static.vecteezy.com/system/resources/previews/000/388/056/original/vector-illustration-of-a-beverage-cup.jpg',
    'https://www.pinpng.com/pngs/m/247-2477038_personal-hygiene-products-clipart-hd-png-download.png',
    'https://i.pinimg.com/564x/c7/b7/d7/c7b7d73f623bc6d59582e00eb09a1c3e.jpg'
  ];

  void registerSave(boxCategory, boxName, boxPrice) {
    String registredCategory = boxCategory;
    String registredName = boxName.text;
    String registredPrice = boxPrice.text;
    boxName.clear();
    boxPrice.clear();

    Item newItem = Item(
      category: registredCategory,
      name: registredName,
      value:
          double.parse(registredPrice.replaceAll(',', '.')).toStringAsFixed(2),
    );

    items.add(newItem);
  }

  deleteItem(int i) {
    items.removeAt(i);
    notifyListeners();
  }

  deleteAll() {
    return items.clear();
  }

  int get count {
    return items.length;
  }

  String strWithComal(String strNumber) {
    return strNumber.replaceFirst('.', ',');
  }

  String get totValue {
    var listItem = items.toList().isNotEmpty
        ? items.map((item) => double.parse(item.value!.replaceAll(',', '.')))
        : null;
    var valorTotalInt =
        listItem != null ? listItem.reduce((prev, nxt) => prev + nxt) : 0.00;
    String tot = strWithComal(valorTotalInt.toStringAsFixed(2));
    return tot;
  }

  String showImg(String category) {
    return imgCard[categories.indexOf(category)];
    //     imgCard[0]
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
