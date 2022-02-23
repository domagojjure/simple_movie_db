import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/loader.dart';
import '../widgets/movie_item.dart';
import '../api/api.dart';
import '../models/cast.dart';
import '../models/movie.dart';

class ListScreenMovies extends StatelessWidget {
  final ApiService api = new ApiService();

  Widget fillMovieTab() {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Container();
        } else {
          final List<Movie> movieData = projectSnap.data as List<Movie>;
          return ListView.builder(
            itemCount: movieData.length,
            itemBuilder: (context, index) {
              return MovieItem(
                movieData[index].id,
                movieData[index].releaseDate,
                movieData[index].title,
                movieData[index].posterPath,
                movieData[index].overview,

                //dodati glumce   // E sada nemam pojma kako dodati glumce iz razloga jer mi treba id filma za dohvat.
              );
            },
          );
        }
      },
      future: api.getPopularMovie(),
    );
  }

  static const routeName = '/list-screen-movies';
  @override
  Widget build(BuildContext context) {
    //final listMovies = Provider.of<MovieLoader>(context).downloadedMovies;
    //final cast=;
    return Scaffold(
      appBar: AppBar(title: Text('top movies')),
      body: fillMovieTab(),
      // body: ListView.builder(
      //   itemBuilder: (context, index) {
      //     return MovieItem(
      //       listMovies[index].id as int,
      //       listMovies[index].releaseDate as String,
      //       listMovies[index].title as String,
      //       listMovies[index].posterPath as String,
      //       listMovies[index].overview as String,
      //       ApiService().getCastList(listMovies[index].id) as List<Cast>,
      //       //dodati glumce
      //     );
      //   },
      //   itemCount: listMovies.length,
      // ),
    );
  }
}
