import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpHelloView extends StatefulWidget {
  const HttpHelloView({super.key});

  @override
  State<HttpHelloView> createState() => _HttpHelloViewState();
}

class _HttpHelloViewState extends State<HttpHelloView> {
  late bool isHaveData;
  Map<String, dynamic>? data;

  @override
  void initState() {
    super.initState();
    isHaveData = false;
    data = null;
  }

  Future<String> getApiName() async {
    var response = await http.get(Uri.parse(
        "https://restapi-1c834-default-rtdb.firebaseio.com/user.json"));
    return response.body;
  }

  // Future<void> getApiName() async {
  //   try {
  //     var response = await http.get(Uri.parse(
  //         "https://restapi-1c834-default-rtdb.firebaseio.com/user.json"));
  //     var decodedData = json.decode(response.body) as Map<String, dynamic>;
  //     setState(() {
  //       isHaveData = true;
  //       this.data = decodedData;
  //     });
  //   } catch (e) {
  //     print('Veri işlenirken bir hata oluştu: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            // buildContainerReq(),
            Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: getApiName(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    var decodedData = json.decode(snapshot.data.toString())
                        as Map<String, dynamic>;
                    return Text("${decodedData["name"]}");
                  } else {
                    return Text("You have error. Look at api");
                  }
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  return Text("You have error. Are You sure api ? ");
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainerReq() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isHaveData
              ? Text("${this.data?["name"]}")
              : CircularProgressIndicator(),
          ElevatedButton(
              onPressed: () async {
                await getApiName();
              },
              child: Text("Send Request")),
        ],
      ),
    );
  }
}
