import 'package:flutter/material.dart';
import 'package:moviesapp/widgets/card_poster_widget.dart';

class MoreMovies extends StatelessWidget {
  final List<dynamic> snapshot;

  const MoreMovies({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        itemCount: snapshot.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 30,
        ),
        itemBuilder: (ctx, i) {
          return CardPosterWidget(
            title: snapshot[i].title,
            imgPoster: snapshot[i].imgPoster,
            imgBackDrop: snapshot[i].imgBackDrop,
            overview: snapshot[i].overview,
            year: snapshot[i].year,
            score: snapshot[i].score,
          );
        },
      ),
    );
  }
}
