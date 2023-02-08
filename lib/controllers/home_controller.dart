import 'package:http/http.dart' as http;
import 'package:moviesapp/repositories/movies_repository.dart';

class HomeController {
  final MoviesRepository moviesRepository = MoviesRepository();

  Future<List<dynamic>> fetchPopularMovies() async {
    return await moviesRepository.fetchPopularMovies(http.Client());
  }

  Future<List<dynamic>> fetchTopRatedMovies() async {
    return await moviesRepository.fetchTopRatedMovies(http.Client());
  }

  Future<List<dynamic>> fetchNowPlayingMovies() async {
    return await moviesRepository.fetchNowPlayingMovies(http.Client());
  }
}
