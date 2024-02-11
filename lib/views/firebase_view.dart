import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:screans_until/model/book.dart';

class FirebaseBookView extends StatefulWidget {
  const FirebaseBookView({super.key});

  @override
  State<FirebaseBookView> createState() => _FirebaseBookViewState();
}

class _FirebaseBookViewState extends State<FirebaseBookView> {
  final TextEditingController _bookNameTEC = TextEditingController();
  final TextEditingController _bookIDTEC = TextEditingController();
  final TextEditingController _bookAuthorTEC = TextEditingController();

  Future _postBookData() async {
    final _book = Book();
    _book.author = _bookAuthorTEC.text;
    _book.id = int.parse(_bookIDTEC.text);
    _book.title = _bookNameTEC.text;
    final response = await http.post(
        Uri.parse(
            "https://sampleapi-8b37c-default-rtdb.firebaseio.com/api/books.json"),
        body: json.encode(_book.toJson()));
    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                  child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _bookNameTEC,
                      decoration: const InputDecoration(labelText: "Title"),
                    ),
                    TextField(
                      controller: _bookIDTEC,
                      decoration: const InputDecoration(labelText: "Id"),
                    ),
                    TextField(
                      controller: _bookAuthorTEC,
                      decoration: const InputDecoration(labelText: "Author"),
                    ),
                    IconButton(
                        onPressed: () async {
                          final _result = await _postBookData();
                          print(_result);
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.blue,
                        )),
                  ],
                ),
              ));
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  AppBar get _appBar => AppBar(
        title: const Text("Post Book View"),
      );
}
