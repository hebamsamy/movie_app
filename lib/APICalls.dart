import 'package:http/http.dart' as http;
import 'dart:convert';

class APICalls {
  Future<Movie> GetMovie() async {
    Movie list = Movie(id: 0, original_title: "");
    try {
      print("Calling ");
      //https://api.mohamed-sadek.com/Student/Get
      //https://api.themoviedb.org/3/movie/550?api_key=eb03df251074313f6e24c705f23a1cdc
      Uri path = Uri.https("api.themoviedb.org", "3/movie/550",
          {"api_key": "eb03df251074313f6e24c705f23a1cdc"});
      http.Response response = await http.get(path);
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        list = data;
        print(data);
      } else {
        print("error");
      }
    } catch (ex) {
      print(ex.toString());
    }
    return list;
  }
}

class Movie {
  int id;
  String original_title;
  Movie({required this.id, required this.original_title});
}
