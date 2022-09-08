import 'dart:convert';
import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/APICalls.dart';
import 'package:movie_app/loader.dart';
import 'package:movie_app/movie_card.dart';

class ListScreen extends StatefulWidget {
  String topic;
  ListScreen({required this.topic});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Movie> list = [];
  bool isLastPage = false;
  int pageNumber = 1;
  bool error = false;
  bool loading = true;
  @override
  void initState() {
    callAPI();
    super.initState();
  }

  callAPI() async {
    var api = APICalls();
    List<Movie> returnedlist =
        await api.getMoviesList(widget.topic, pageNumber);

    setState(() {
      list = returnedlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return Loader(color: Colors.white);
    } else {
      return GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemCount: list.length,
        itemBuilder: (context, index) => MovieCard(
          movie: list[index],
        ),
      );
    }
  }
}
