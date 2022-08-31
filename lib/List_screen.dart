import 'dart:convert';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'package:movie_app/APICalls.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    print("insialiezd");
    callAPI();
    super.initState();
  }

  callAPI() async {
    var api = APICalls();
    Movie item = await api.GetMovie();
    print(item);
  }

  @override
  Widget build(BuildContext context) {
    // print("build");
    return Center(
      child: Column(
        children: [
          Text("List"),
          OutlinedButton(
              onPressed: () {
                callAPI();
              },
              child: Text("Get data"))
        ],
      ),
    );
  }
}
