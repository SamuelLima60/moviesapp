import 'package:flutter/material.dart';
import 'package:moviesapp/views/more_movies_view.dart';

class SeeMoreWidget extends StatelessWidget {
  final List<dynamic> snapshot;
  final String category;

  const SeeMoreWidget(this.category, this.snapshot, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoreMovies(snapshot: snapshot),
                    ),
                  );
                },
                child: const Text(
                  'See more',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
