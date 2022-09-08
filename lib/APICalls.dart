import 'package:http/http.dart';
import 'dart:convert';

class APICalls {
  Future<Movie> GetMovie(int id) async {
    Movie list = Movie(
      id: 0,
      title: "",
      overview: "",
      poster: "",
      backdrop: "",
      popularity: 0.0,
      vote_average: 0.0,
      vote_count: 0,
      original_language: '',
      adult: false,
      release_date: "",
    );
    try {
      Uri path = Uri.https("api.themoviedb.org", "3/movie/${id}",
          {"api_key": "eb03df251074313f6e24c705f23a1cdc"});
      Response response = await get(path);
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        list.tagline = data['tagline'] ?? "";
        list.homepage = data['homepage'] ?? "";

        list = Movie(
          id: data['id'],
          title: data['title'],
          overview: data['overview'] ?? "",
          popularity: data['popularity'] as double,
          vote_average: data['vote_average'] + .0,
          vote_count: data['vote_count'],
          original_language: data['original_language'],
          adult: data['adult'],
          release_date: data['release_date'],
          backdrop: data['backdrop_path'] ?? "",
          poster: data['poster_path'] ?? "",
        );
      } else {
        print("error");
      }
    } catch (ex) {
      print(ex.toString());
    }
    return list;
  }

  Future<List<Movie>> getMoviesList(String topic, int page) async {
    //eb03df251074313f6e24c705f23a1cdc
    //https://api.themoviedb.org/3/movie/now_playing
    //https://api.themoviedb.org/3/movie/popular
    //https://api.themoviedb.org/3/movie/top_rated
    //https://api.themoviedb.org/3/movie/upcoming
    List<Movie> retutnedList = [];
    Uri url = Uri.https("api.themoviedb.org", "/3/movie/${topic}?page=${page}",
        {"api_key": "eb03df251074313f6e24c705f23a1cdc"});
    Response data = await get(url);
    if (data.statusCode == 200) {
      var converted = jsonDecode(data.body);
      var temp = converted["results"] as List;
      retutnedList = temp
          .map((elem) => Movie(
                id: elem['id'],
                title: elem['title'],
                overview: elem['overview'] ?? "",
                popularity: elem['popularity'] as double,
                vote_average: elem['vote_average'] + .0,
                vote_count: elem['vote_count'],
                original_language: elem['original_language'],
                adult: elem['adult'],
                release_date: elem['release_date'],
                backdrop: elem['backdrop_path'] ?? "",
                poster: elem['poster_path'] ?? "",
              ))
          .toList();
    } else {
      print("Error");
    }
    return retutnedList;
  }

  Future<List<Movie>> getSimilerMovies(int id) async {
    //eb03df251074313f6e24c705f23a1cdc
    //https: //api.themoviedb.org/3/movie/{movie_id}/similar?api_key=<<api_key>>&language=en-US&page=1
    List<Movie> retutnedList = [];
    Uri url = Uri.https("api.themoviedb.org", "/3/movie/${id}/similar", {
      "api_key": "eb03df251074313f6e24c705f23a1cdc",
    });
    Response data = await get(url);
    if (data.statusCode == 200) {
      var converted = jsonDecode(data.body);
      var temp = converted["results"] as List;
      retutnedList = temp
          .map((elem) => Movie(
                id: elem['id'],
                title: elem['title'],
                overview: elem['overview'] ?? "",
                popularity: elem['popularity'] as double,
                vote_average: elem['vote_average'] + .0,
                vote_count: elem['vote_count'],
                original_language: elem['original_language'],
                adult: elem['adult'],
                release_date: elem['release_date'],
                backdrop: elem['backdrop_path'] ?? "",
                poster: elem['poster_path'] ?? "",
              ))
          .toList();
    } else {
      print("Error");
    }
    return retutnedList;
  }

  Future<List<Movie>> BelongsTo(int id) async {
    //eb03df251074313f6e24c705f23a1cdc
    //https: //api.themoviedb.org/3/movie/{movie_id}/lists?api_key=<<api_key>>&language=en-US&page=1
    List<Movie> retutnedList = [];
    Uri url = Uri.https("api.themoviedb.org", "/3/movie/${id}/lists", {
      "api_key": "eb03df251074313f6e24c705f23a1cdc",
    });
    Response data = await get(url);
    if (data.statusCode == 200) {
      var converted = jsonDecode(data.body);
      var temp = converted["results"] as List;
      retutnedList = temp
          .map((elem) => Movie(
                id: elem['id'],
                title: elem['title'],
                overview: elem['overview'] ?? "",
                popularity: elem['popularity'] as double,
                vote_average: elem['vote_average'] + .0,
                vote_count: elem['vote_count'],
                original_language: elem['original_language'],
                adult: elem['adult'],
                release_date: elem['release_date'],
                backdrop: elem['backdrop_path'] ?? "",
                poster: elem['poster_path'] ?? "",
              ))
          .toList();
    } else {
      print("Error");
    }
    return retutnedList;
  }

  Future<List<Movie>> SearchforMovies(String value) async {
    //https://api.themoviedb.org/3/search/movie?api_key={api_key}&query={MovieName}
    List<Movie> retutnedList = [];
    Uri url = Uri.https("api.themoviedb.org", "/3/search/movie",
        {"api_key": "eb03df251074313f6e24c705f23a1cdc", "query": value});
    Response data = await get(url);
    if (data.statusCode == 200) {
      var converted = jsonDecode(data.body);
      var temp = converted["results"] as List;
      retutnedList = temp
          .map((elem) => Movie(
                id: elem['id'],
                title: elem['title'],
                overview: elem['overview'] ?? "",
                popularity: elem['popularity'] as double,
                vote_average: elem['vote_average'] + .0,
                vote_count: elem['vote_count'],
                original_language: elem['original_language'],
                adult: elem['adult'],
                release_date: elem['release_date'],
                backdrop: elem['backdrop_path'] ?? "",
                poster: elem['poster_path'] ?? "",
              ))
          .toList();
    } else {
      print("Error");
    }
    return retutnedList;
  }
}

class Movie {
  int id;
  String title;
  String overview;
  bool adult;
  String release_date;
  String original_language;
  double popularity;
  int vote_count;
  double vote_average;
  String tagline = "";
  String backdrop_path = "https://image.tmdb.org/t/p/w500/";
  String poster_path = "https://image.tmdb.org/t/p/w500/";
  String homepage = "";
  Movie(
      {required this.id,
      required this.title,
      required this.overview,
      required this.adult,
      required this.release_date,
      required this.original_language,
      required this.popularity,
      required this.vote_average,
      required this.vote_count,
      required String poster,
      required String backdrop}) {
    this.poster_path = "${this.poster_path}${poster}";
    this.backdrop_path = "${this.backdrop_path}${backdrop}";
  }
}
