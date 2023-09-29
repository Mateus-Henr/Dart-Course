import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste/model/movie.dart';
import 'package:teste/services/tmdb_service.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("IMDb Movies App"),
        ),
        body: FutureBuilder(
            future: TmdbService().getPopularMovies(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text("Error"));
              }

              if (!snapshot.hasData) {
                return const Center(child: Text("Loading..."));
              }

              List<Movie> movies = snapshot.data as List<Movie>;

              return ListView(
                children: movies
                    .map((e) => Column(
                          children: [
                            Text(e.title),
                            Text(e.overview),
                            Image.network(
                                "https://image.tmdb.org/t/p/w500${e.posterPath}"),
                          ],
                        ))
                    .toList(),
              );
            }));
  }
}
