import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:screans_until/model/post.dart';
import 'package:http/http.dart' as http;

class JsonPlaceHolderView extends StatefulWidget {
  const JsonPlaceHolderView({Key? key}) : super(key: key);

  @override
  State<JsonPlaceHolderView> createState() => _JsonPlaceHolderViewState();
}

class _JsonPlaceHolderViewState extends State<JsonPlaceHolderView> {
  late Future<Posts> _futurePost;

  @override
  void initState() {
    super.initState();
    _futurePost = getJsonPlaceHolderDatas();
  }

  Future<Posts> getJsonPlaceHolderDatas() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/2"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return Posts.fromJson(responseData);
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _placeHolderDatasWidget(),
      ),
    );
  }

  Widget _placeHolderDatasWidget() {
    return FutureBuilder<Posts>(
      future: _futurePost,
      builder: (BuildContext context, AsyncSnapshot<Posts> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Center(
            child: ListTile(
              title: Text(snapshot.data!.title ?? ''),
              subtitle: Text(snapshot.data!.body ?? ''),
            ),
          );
        }
      },
    );
  }
}
