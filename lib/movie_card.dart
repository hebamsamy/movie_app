import "package:flutter/material.dart";
import 'package:movie_app/APICalls.dart';
import 'package:movie_app/Details_Screen.dart';

class MovieCard extends StatelessWidget {
  Movie movie;
  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(id: movie.id)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              movie.poster_path,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            title: Text(
              movie.title,
              style: TextStyle(fontSize: 15),
              softWrap: true,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 20,
                ),
                Text(movie.vote_average.toString())
              ],
            ),
          ),
        ],
      ),
    );

    //  Card(
    //Color.fromARGB(255, 0, 0, 0)umn(children: [
    //     Image.network(movie.poster_path),
    //     ListTile(
    //       leading: Text(movie.title),
    //       trailing: Column(
    //         children: [
    //           Icon(
    //             Icons.star,
    //             color: Colors.yellow,
    //           ),
    //           Text(movie.id.toString())
    //         ],
    //       ),
    //     )
    //   ]),
    // );
  }
}
