import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/loader.dart';
import '../widgets/movie_item.dart';
import '../api/api.dart';
import '../models/cast.dart';
import '../models/movie.dart';

class ListScreenMovies extends StatefulWidget {
  static const routeName = '/list-screen-movies';

  @override
  State<ListScreenMovies> createState() => _ListScreenMoviesState();
}

class _ListScreenMoviesState extends State<ListScreenMovies> {
  final ApiService api = ApiService();
  late Future<List<Movie>> _future;
  List<Movie> listAll = [];
  var page = 1;
  ScrollController _controller = ScrollController();
  @override
  void initState() {
    _future = api.getPopularMovie(page);

    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        if (page < 2) {
          page++;
          setState(() {
            _future = api.getPopularMovie(page);
          });
        }
      }
    });
  }

  Widget fillMovieTab(int page) {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.data == null) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Container(
              child: Center(
            child: CircularProgressIndicator(),
          ));
        } else {
          print('u widgedtu fillmovietab page je ${page} ');
          final List<Movie> movieData = projectSnap.data as List<Movie>;
          listAll.addAll(movieData);
          listAll = listAll.toSet().toList();
          return ListView.builder(
            controller: _controller,
            itemCount: listAll.length,
            itemBuilder: (context, index) {
              return MovieItem(
                listAll[index].id,
                listAll[index].releaseDate,
                listAll[index].title,
                listAll[index].posterPath,
                listAll[index].overview,

                //dodati glumce   // E sada nemam pojma kako dodati glumce iz razloga jer mi treba id filma za dohvat.
              );
            },
          );
        }
      },
      future: _future, // tu bi trebao kao argument predati paginaciju
    );
  }

  @override
  Widget build(BuildContext context) {
    //var page = 1;
    //final listMovies = Provider.of<MovieLoader>(context).downloadedMovies;
    //final cast=;
    return Scaffold(
      appBar: AppBar(
        title: Text('top movies'),
        // actions: [
        //   PopupMenuButton(
        //       itemBuilder: (context) => [
        //             PopupMenuItem(
        //               child: Text('1. page'),
        //               value: 1,
        //             ),
        //             PopupMenuItem(
        //               child: Text('2. page'),
        //               value: 2,
        //             ),
        //             PopupMenuItem(
        //               child: Text('3. page'),
        //               value: 3,
        //             ),
        //             PopupMenuItem(
        //               child: Text('4. page'),
        //               value: 4,
        //             ),
        //           ],
        //       onSelected: (value) {
        //         setState(() {
        //           if (value == 2) {
        //             page = 2;
        //           } else if (value == 3) {
        //             page = 3;
        //           } else if (value == 4) {
        //             page = 4;
        //           } else if (value == 1) {
        //             page = 1;
        //           }
        //           print('u set stage fazi page je ${page}');
        //         });
        //       })
        // ],
      ),
      body: fillMovieTab(page),
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
