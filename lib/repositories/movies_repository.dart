import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviesapp/constants/movies_constants.dart';
import 'package:moviesapp/models/movies_model.dart';

class MoviesRepository {
  Future<List<dynamic>> fetchNowPlayingMovies(http.Client client) async {
    final response = await client.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=${MoviesConstants.apiKey}'));

    if (response.statusCode == 200) {
      var parsedList = jsonDecode(response.body);

      return parsedList['results']
          .map((val) => MoviesModel.fromJson(val))
          .toList();
    } else {
      throw Exception('Failed to load movie');
    }
  }

  Future<List<dynamic>> fetchPopularMovies(http.Client client) async {
    final response = await client.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=${MoviesConstants.apiKey}'));

    if (response.statusCode == 200) {
      var parsedList = jsonDecode(response.body);

      return parsedList['results']
          .map((val) => MoviesModel.fromJson(val))
          .toList();
    } else {
      throw Exception('Failed to load movie');
    }
  }

  Future<List<dynamic>> fetchTopRatedMovies(http.Client client) async {
    final response = await client.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=${MoviesConstants.apiKey}'));

    if (response.statusCode == 200) {
      var parsedList = jsonDecode(response.body);

      return parsedList['results']
          .map((val) => MoviesModel.fromJson(val))
          .toList();
    } else {
      throw Exception('Failed to load movie');
    }
  }
}
