import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movies/helpers/debouncer.dart';
import 'package:movies/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apyKey = 'fb2683306562c11cd4066cfb35a00c8c';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> moviesCast = {};
  int _page = 0;
  final debouncer = Debouncer(duration: const Duration(milliseconds: 500));
  final StreamController<List<Movie>> _suggestionsStreamController = StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream => _suggestionsStreamController.stream;
  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromRawJson(jsonData);
    onDisplayMovies = nowPlayingResponse.results!;
    notifyListeners();
  }

  getPopularMovies() async {
    _page += 1;
    final jsonData = await _getJsonData('3/movie/popular', _page);
    final popularResponse = ListMoviesResponse.fromRawJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponse.results!];
    notifyListeners();
  }

  Future<List<Cast>> getMoviesCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final CreditsResponse creditsResponse =
        CreditsResponse.fromRawJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }

  Future<String> _getJsonData(String segment, [int page = 1]) async {
    var url = Uri.https(_baseUrl, segment, {
      'api_key': _apyKey,
      'language': _language,
      'page': '$page',
    });

    final response = await http.get(url);
    return response.body;
  }

  Future<List<Movie>> searchMovie(String query) async {
    var url = Uri.https(_baseUrl, '3/search/movie', {
      'api_key': _apyKey,
      'language': _language,
      'query': query,
    });
    final response = await http.get(url);
    final searchResponse = SearchResponse.fromRawJson(response.body);
    return searchResponse.results!;
  }


  void getSuggestionsByQuery(String query) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final results = await searchMovie(query);
      _suggestionsStreamController.add(results);
    };
      
    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
        debouncer.value = query;
      });
      Future.delayed(const Duration(milliseconds: 300)).then((_) => timer.cancel());
    }
  }

