import 'package:flutter/material.dart';

class CardListItem extends StatelessWidget {
  const CardListItem({super.key, this.title, this.icons, this.onPress});

  final String? title;
  final IconData? icons;
  final VoidCallback? onPress;

  final double _textSize = 50;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: Card(
        child: ListTile(
          onTap: onPress,
          title: Text(
            title ?? "",
            style: TextStyle(fontSize: _textSize),
          ),
          trailing: Icon(icons ?? Icons.warning),
        ),
      ),
    );
  }
}
