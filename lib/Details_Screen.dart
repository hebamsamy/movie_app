import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/APICalls.dart';
import 'package:movie_app/loader.dart';

class DetailsScreen extends StatefulWidget {
  int id;
  DetailsScreen({required this.id});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  APICalls api = APICalls();
  Movie? movie;
  @override
  void initState() {
    super.initState();
    get();
  }

  get() async {
    Movie returned = await api.GetMovie(widget.id);
    setState(() {
      movie = returned;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (movie == null) {
      return Loader(color: Colors.white);
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            movie!.title,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }
  }
}
