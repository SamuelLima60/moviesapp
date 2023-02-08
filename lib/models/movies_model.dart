class MoviesModel {
  final String title;
  final String imgPoster;
  final String imgBackDrop;
  final String overview;
  final String year;
  final int score;

  const MoviesModel({
    required this.title,
    required this.imgPoster,
    required this.imgBackDrop,
    required this.overview,
    required this.year,
    required this.score,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      title: json['original_title'],
      imgPoster: json['poster_path'],
      overview: json['overview'],
      year: json['release_date'].split('-')[0],
      imgBackDrop: json['backdrop_path'],
      score: json['vote_average'].round(),
    );
  }
}
