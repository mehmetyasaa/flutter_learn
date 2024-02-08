import 'dart:html';

import 'package:flutter/material.dart';
import 'package:screans_until/widgets/list_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen Until"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(),
          CardListItem(
            title: 'selam' ?? "",
            icons: Icons.dock_sharp,
            onPress: () {},
          ),
          CardListItem(),
        ],
      ),
    );
  }
}
