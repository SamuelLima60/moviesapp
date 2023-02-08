import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MoviesDetailsView extends StatelessWidget {
  final String title;
  final String imgBackDrop;
  final String overview;
  final String year;
  final int score;

  const MoviesDetailsView(
      this.imgBackDrop, this.title, this.overview, this.year, this.score,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
            imageUrl: 'https://image.tmdb.org/t/p/w500/$imgBackDrop',
            progressIndicatorBuilder: (
              context,
              url,
              downloadProgress,
            ) =>
                CircularProgressIndicator(
              value: downloadProgress.progress,
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title ($year)',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Sinopse',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "$overview\n",
                  textAlign: TextAlign.left,
                ),
                const Text(
                  'Avaliação dos usuários',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$score/10',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
