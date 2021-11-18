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
  @override
  Widget build(BuildContext context) {
    final Items listItems = Provider.of(context);
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
          title: Text(
            widget.title!,
            style: const TextStyle(fontSize: 24),
          ),
          subtitle: Text(
            widget.price!,
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
