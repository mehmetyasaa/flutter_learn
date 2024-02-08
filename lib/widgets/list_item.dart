import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardListItem extends StatelessWidget {
  CardListItem({this.title, this.icons, this.onPress});

  final String? title;
  final IconData? icons;
  final VoidCallback? onPress;

  final double _textSize = 50;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1
      // ScreenUtil.instance.setHeight(30)
      ,
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
