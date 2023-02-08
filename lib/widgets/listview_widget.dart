import 'package:flutter/material.dart';
import 'package:moviesapp/widgets/card_poster_widget.dart';
import 'package:moviesapp/widgets/see_more_widget.dart';

class ListViewWidget extends StatelessWidget {
  final AsyncSnapshot<List<List<dynamic>>> snapshot;

  const ListViewWidget({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    Widget listViewPost(int indexList) {
      return SizedBox(
        height: 250,
        width: double.infinity,
        child: ListView.builder(
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, i) {
            return CardPosterWidget(
              title: snapshot.data?[indexList][i].title,
              imgPoster: snapshot.data?[indexList][i].imgPoster,
              imgBackDrop: snapshot.data?[indexList][i].imgBackDrop,
              overview: snapshot.data?[indexList][i].overview,
              year: snapshot.data?[indexList][i].year,
              score: snapshot.data?[indexList][i].score,
            );
          },
        ),
      );
    }

    return Column(
      children: [
        SeeMoreWidget('Ultimos Filmes', snapshot.data![0]),
        listViewPost(0),
        SeeMoreWidget('Populares', snapshot.data![1]),
        listViewPost(1),
        SeeMoreWidget('Mais Votados', snapshot.data![2]),
        listViewPost(2),
      ],
    );
  }
}
