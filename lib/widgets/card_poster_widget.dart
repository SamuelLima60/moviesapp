import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/views/movies_details_view.dart';

class CardPosterWidget extends StatelessWidget {
  final String title;
  final String imgPoster;
  final String imgBackDrop;
  final String overview;
  final String year;
  final int score;

  const CardPosterWidget({
    super.key,
    required this.title,
    required this.imgPoster,
    required this.imgBackDrop,
    required this.overview,
    required this.year,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) =>
                  MoviesDetailsView(imgPoster, title, overview, year, score),
            ),
          );
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  text: title,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: CachedNetworkImage(
                  width: 200,
                  height: 100,
                  fit: BoxFit.fill,
                  imageUrl: 'https://image.tmdb.org/t/p/w500/$imgPoster',
                  progressIndicatorBuilder: (
                    context,
                    url,
                    downloadProgress,
                  ) =>
                      CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
