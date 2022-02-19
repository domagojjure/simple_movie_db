import 'package:flutter/material.dart';
import '../widgets/movie_item.dart';

class ListScreenMovies extends StatelessWidget {
  final dummyMovie = [
    [
      1,
      '1997',
      'Titanic',
      'https://upload.wikimedia.org/wikipedia/en/1/18/Titanic_%281997_film%29_poster.png'
    ],
    [
      2,
      '1995',
      'Braveheart',
      'https://upload.wikimedia.org/wikipedia/en/5/55/Braveheart_imp.jpg',
    ],
  ];

  static const routeName = '/list-screen-movies';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('top movies')),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MovieItem(
            dummyMovie[index][0] as int,
            dummyMovie[index][1] as String,
            dummyMovie[index][2] as String,
            dummyMovie[index][3] as String,
          );
        },
        itemCount: dummyMovie.length,
      ),
    );
  }
}
