import 'package:flutter/material.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:movies/search/search_delegate.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //listen redibuja el widget
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Peliculas de cartelera'),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                    context: context, 
                    delegate: MovieSearchDelegate()
                  );
                }, 
                icon: const Icon(Icons.search_outlined)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Tarjetas
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              //slider de peliculas
              MoviesSlider(
                movies: moviesProvider.popularMovies,
                title: 'Pupulares',
                onNextPage: () => moviesProvider.getPopularMovies(),
              ),
            ],
          ),
        ));
  }
}
