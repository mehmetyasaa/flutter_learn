import 'package:flutter/material.dart';
import 'package:screans_until/views/form_view.dart';
import 'package:screans_until/views/json_placeholder_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        "/home": (context) => JsonPlaceHolderView(),
        "/": (context) => FormView(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
