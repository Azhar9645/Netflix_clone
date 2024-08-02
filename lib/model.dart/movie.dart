class Movie {
  final int id;
  final String title;
  final String imagePath;
  final String overview;
  final String? releasedate;

  Movie({
    required this.id,
    this.releasedate,
    required this.title,
    required this.imagePath,
    required this.overview,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json['id'],
        title: json['title'],
        imagePath: json['poster_path'],
        overview: json['overview'],
        releasedate: json['release_date'],
       
      );

}
