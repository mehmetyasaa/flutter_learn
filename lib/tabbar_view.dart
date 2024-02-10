import 'package:flutter/material.dart';
import 'package:screans_until/httpHello.dart';
import 'package:screans_until/views/home.dart';

class TabbarView extends StatefulWidget {
  const TabbarView({super.key});

  @override
  State<TabbarView> createState() => _TabbarViewState();
}

class _TabbarViewState extends State<TabbarView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.home),
          ),
          bottomNavigationBar: const SafeArea(
              child: TabBar(
            tabs: [
              Tab(
                child: Icon(Icons.filter_1),
              ),
              Tab(
                child: Icon(Icons.filter_2),
              ),
            ],
          )),
          body: const TabBarView(children: [
            HttpHelloView(),
            HomeView(),
          ]),
        ));
  }
}
