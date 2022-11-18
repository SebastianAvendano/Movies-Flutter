
import 'dart:convert';

class Movie {
    Movie({
        this.adult,
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
    });

    final bool? adult;
    final String? backdropPath;
    final List<int>? genreIds;
    final int? id;
    final String? originalLanguage;
    final String? originalTitle;
    final String? overview;
    final double? popularity;
    final String? posterPath;
    final String? releaseDate;
    final String? title;
    final bool? video;
    final double? voteAverage;
    final int? voteCount;

    String? heroId;
    Movie copyWith({
        bool? adult,
        String? backdropPath,
        List<int>? genreIds,
        int? id,
        String? originalLanguage,
        String? originalTitle,
        String? overview,
        double? popularity,
        String? posterPath,
        String? releaseDate,
        String? title,
        bool? video,
        double? voteAverage,
        int? voteCount,
    }) => 
        Movie(
            adult: adult ?? this.adult,
            backdropPath: backdropPath ?? this.backdropPath,
            genreIds: genreIds ?? this.genreIds,
            id: id ?? this.id,
            originalLanguage: originalLanguage ?? this.originalLanguage,
            originalTitle: originalTitle ?? this.originalTitle,
            overview: overview ?? this.overview,
            popularity: popularity ?? this.popularity,
            posterPath: posterPath ?? this.posterPath,
            releaseDate: releaseDate ?? this.releaseDate,
            title: title ?? this.title,
            video: video ?? this.video,
            voteAverage: voteAverage ?? this.voteAverage,
            voteCount: voteCount ?? this.voteCount,
        );

    get fullPostertImg{
      if (this.posterPath != null)
            return 'https://image.tmdb.org/t/p/w500/${this.posterPath}';
      return 'https://i.stack.imgur.com/GNhxO.png';
    }
    get fullBackdropPath{
      if (this.posterPath != null)
            return 'https://image.tmdb.org/t/p/w500/${this.backdropPath}';
      return 'https://i.stack.imgur.com/GNhxO.png';
    }

    factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        adult: json["adult"] ?? null,
        backdropPath: json["backdrop_path"] ?? null,
        genreIds: json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"] ?? null,
        originalLanguage: json["original_language"] ?? null,
        originalTitle: json["original_title"] ?? null,
        overview: json["overview"] ?? null,
        popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
        posterPath: json["poster_path"] ?? null,
        releaseDate: json["release_date"] == null ? null : json["release_date"],
        title: json["title"] ?? null,
        video: json["video"] ?? null,
        voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
        voteCount: json["vote_count"] ?? null,
    );
}