import 'package:flutter/material.dart';
import 'package:screans_until/widgets/list_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isDark = false;

  void _backgroundChance() {
    setState(() {
      _isDark = !_isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        title: Text("Screen Until"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
              visible: _isDark,
              child: Text(
                "is dark mode open",
                style: TextStyle(color: Colors.red),
              )),
          ElevatedButton(
              onPressed: _backgroundChance, child: Icon(Icons.light)),
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
