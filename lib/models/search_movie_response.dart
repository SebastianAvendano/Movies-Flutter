// To parse this JSON data, do
//
//     final creditsResponse = creditsResponseFromJson(jsonString);

import 'dart:convert';

import 'models.dart';

SearchResponse creditsResponseFromJson(String str) => SearchResponse.fromJson(json.decode(str));

class SearchResponse {
    SearchResponse({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    final int? page;
    final List<Movie>? results;
    final int? totalPages;
    final int? totalResults;

    SearchResponse copyWith({
        int? page,
        List<Movie>? results,
        int? totalPages,
        int? totalResults,
    }) => 
        SearchResponse(
            page: page ?? this.page,
            results: results ?? this.results,
            totalPages: totalPages ?? this.totalPages,
            totalResults: totalResults ?? this.totalResults,
        );

    factory SearchResponse.fromRawJson(String str) => SearchResponse.fromJson(json.decode(str));

    factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        page: json["page"] == null ? null : json["page"],
        results: json["results"] == null ? null : List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        totalResults: json["total_results"] == null ? null : json["total_results"],
    );
}
