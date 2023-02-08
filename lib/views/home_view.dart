import 'package:flutter/material.dart';
import 'package:moviesapp/controllers/home_controller.dart';
import 'package:moviesapp/widgets/listview_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final Future<List<dynamic>> futurePopularMovies,
      futureTopRatedMovies,
      futureNowPlayingMovies;

  @override
  void initState() {
    super.initState();
    futurePopularMovies = HomeController().fetchPopularMovies();
    futureTopRatedMovies = HomeController().fetchTopRatedMovies();
    futureNowPlayingMovies = HomeController().fetchNowPlayingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('MoviesApp'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: Future.wait([
            futureNowPlayingMovies,
            futurePopularMovies,
            futureTopRatedMovies,
          ]),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListViewWidget(snapshot: snapshot);
            } else if (snapshot.hasError) {
              throw Exception(snapshot.error);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
