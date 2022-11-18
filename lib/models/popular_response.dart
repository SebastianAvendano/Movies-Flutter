// To parse this JSON data, do
//
//     final nowPlayingResponse = nowPlayingResponseFromJson(jsonString);

import 'dart:convert';

import 'models.dart';

class ListMoviesResponse {
    ListMoviesResponse({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    final int? page;
    final List<Movie>? results;
    final int? totalPages;
    final int? totalResults;

    ListMoviesResponse copyWith({
        int? page,
        List<Movie>? results,
        int? totalPages,
        int? totalResults,
    }) => 
        ListMoviesResponse(
            page: page ?? this.page,
            results: results ?? this.results,
            totalPages: totalPages ?? this.totalPages,
            totalResults: totalResults ?? this.totalResults,
        );

    factory ListMoviesResponse.fromRawJson(String str) => ListMoviesResponse.fromJson(json.decode(str));

    factory ListMoviesResponse.fromJson(Map<String, dynamic> json) => ListMoviesResponse(
        page: json["page"] == null ? null : json["page"],
        results: json["results"] == null ? null : List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        totalResults: json["total_results"] == null ? null : json["total_results"],
    );
}