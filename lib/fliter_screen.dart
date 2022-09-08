// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie_app/APICalls.dart';
import 'package:movie_app/movie_card.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String inputData = "";
  List<Movie> list = [];
  APICalls api = APICalls();
  callApi() async {
    if (inputData.isEmpty) {
      return;
    }
    var retlist = await api.SearchforMovies(inputData);
    setState(() {
      list = retlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          trailing: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              side: BorderSide(color: Colors.white),
            ),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              callApi();
            },
          ),
          title: TextField(
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15))),
            onChanged: (value) {
              setState(() {
                inputData = value;
              });
            },
          ),
        ),
        Expanded(
          child: (list.isEmpty)
              ? Center(
                  child: Text("Explore our Movies!!"),
                )
              : GridView.builder(
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
                ),
        )
      ],
    );
  }
}
