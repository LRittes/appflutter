import 'package:ativ4/controllers/list_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardItem extends StatefulWidget {
  final String? category;
  final String? title;
  final String? price;
  final int? index;
  const CardItem({
    Key? key,
    this.index,
    this.category,
    this.title,
    this.price,
  }) : super(key: key);

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  List imgCard = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6TeiWp-y_jxH9camU-9AQoyMJkkfGYGdLwQ&usqp=CAU',
    'https://www.clipartmax.com/png/full/101-1011625_aluminum-bank-beverage-cartoon-drink-soda-icon-soft-drinks-png-cartoon.png',
    'https://www.pinpng.com/pngs/m/247-2477038_personal-hygiene-products-clipart-hd-png-download.png',
    'https://i.pinimg.com/564x/c7/b7/d7/c7b7d73f623bc6d59582e00eb09a1c3e.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    final Items provider = Provider.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.deepOrangeAccent, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: InkWell(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Container(
              width: 200,
              child: Image.network(
                  imgCard[provider.categories.indexOf(widget.category)]),
            ),
            radius: 20,
          ),
          title: Text(
            widget.title!,
            style: const TextStyle(fontSize: 24),
          ),
          subtitle: Text(
            'R\$ ${widget.price!}',
            style: const TextStyle(fontSize: 16),
          ),
          trailing: TextButton(
            onPressed: () {
              Provider.of<Items>(context, listen: false)
                  .deleteItem(widget.index!);
            },
            child: const Icon(
              Icons.close,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
