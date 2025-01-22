class MovieDetail {
  final int id;
  final String title;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final List<dynamic> genres;

  MovieDetail({required this.id, required this.title, required this.backdropPath, required this.overview, required this.releaseDate, required this.voteAverage, required this.genres});

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      backdropPath: json['backdropPath'] ?? '',
      overview: json['overview'] ?? '',
      releaseDate: json['releaseDate'] ?? "",
      voteAverage: (json['voteAverage'] ?? 0).toDouble(),
      genres: json['genres'] ?? [],
    );
  }
}