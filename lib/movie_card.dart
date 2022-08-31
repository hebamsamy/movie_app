import "package:flutter/material.dart";
import 'package:movie_app/APICalls.dart';

class MovieCard extends StatelessWidget {
  Movie movie;
  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Image.network(movie.poster_path),
        ListTile(
          leading: Text(movie.title),
          trailing: Column(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text(movie.id.toString())
            ],
          ),
        )
      ]),
    );
  }
}
