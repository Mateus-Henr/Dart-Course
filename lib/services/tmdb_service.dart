import 'dart:convert';

import '../model/movie.dart';
import 'package:http/http.dart' as http;

class TmdbService {
  final api_key = "9071821d7863327f748b777d32b3aaa5";
  final base_url = "https://api.themoviedb.org/3";

  Future<List<Movie>> getPopularMovies() async {
    final res =
        await http.get(Uri.parse('$base_url/movie/popular?api_key=$api_key'));

    if (res.statusCode == 200) {
      var jsonData = json.decode(res.body);

      return (jsonData["results"] as List)
          .map((movie) => Movie.fromJson(movie))
          .toList();
    } else {
      throw Exception("Failed to load movies...");
    }
  }
}
