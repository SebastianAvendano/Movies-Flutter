// To parse this JSON data, do
//
//     final creditsResponse = creditsResponseFromJson(jsonString);

import 'dart:convert';

class CreditsResponse {
    CreditsResponse({
        this.id,
        required this.cast,
        this.crew,
    });

    final int? id;
    final List<Cast> cast;
    final List<Cast>? crew;

    CreditsResponse copyWith({
        int? id,
        List<Cast>? cast,
        List<Cast>? crew,
    }) => 
        CreditsResponse(
            id: id ?? this.id,
            cast: cast ?? this.cast,
            crew: crew ?? this.crew,
        );

    factory CreditsResponse.fromRawJson(String str) => CreditsResponse.fromJson(json.decode(str));

    factory CreditsResponse.fromJson(Map<String, dynamic> json) => CreditsResponse(
        id: json["id"] == null ? null : json["id"],
        cast: json["cast"] == null ? [] : List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        crew: json["crew"] == null ? null : List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
    );
}

class Cast {
    Cast({
        this.adult,
        this.gender,
        this.id,
        this.name,
        this.originalName,
        this.popularity,
        this.profilePath,
        this.castId,
        this.character,
        this.creditId,
        this.order,
        this.job,
    });

    final bool? adult;
    final int? gender;
    final int? id;
    final String? name;
    final String? originalName;
    final double? popularity;
    final String? profilePath;
    final int? castId;
    final String? character;
    final String? creditId;
    final int? order;
    final String? job;

    Cast copyWith({
        bool? adult,
        int? gender,
        int? id,
        String? name,
        String? originalName,
        double? popularity,
        String? profilePath,
        int? castId,
        String? character,
        String? creditId,
        int? order,
        String? job,
    }) => 
        Cast(
            adult: adult ?? this.adult,
            gender: gender ?? this.gender,
            id: id ?? this.id,
            name: name ?? this.name,
            originalName: originalName ?? this.originalName,
            popularity: popularity ?? this.popularity,
            profilePath: profilePath ?? this.profilePath,
            castId: castId ?? this.castId,
            character: character ?? this.character,
            creditId: creditId ?? this.creditId,
            order: order ?? this.order,
            job: job ?? this.job,
        );

    factory Cast.fromRawJson(String str) => Cast.fromJson(json.decode(str));

 get fullProfilePath{
      if (this.profilePath != null)
            return 'https://image.tmdb.org/t/p/w500/${this.profilePath}';
      return 'https://i.stack.imgur.com/GNhxO.png';
    }


    factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        adult: json["adult"] == null ? null : json["adult"],
        gender: json["gender"] == null ? null : json["gender"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        originalName: json["original_name"] == null ? null : json["original_name"],
        popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
        castId: json["cast_id"] == null ? null : json["cast_id"],
        character: json["character"] == null ? null : json["character"],
        creditId: json["credit_id"] == null ? null : json["credit_id"],
        order: json["order"] == null ? null : json["order"],
        job: json["job"] == null ? null : json["job"],
    );
}
