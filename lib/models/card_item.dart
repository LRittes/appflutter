import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {
  final String? category;
  final String? title;
  final String? price;
  const CardItem({
    Key? key,
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
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: InkWell(
        child: ListTile(
          title: Text(widget.title!),
          subtitle: Text(widget.price!),
        ),
      ),
    );
  }
}
