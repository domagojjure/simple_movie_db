import 'package:flutter/material.dart';
import '../api/api.dart';
import 'movie.dart';
import 'cast.dart';

//Zapravo ova klasa mi mozda opce ne treba

class MovieLoader with ChangeNotifier {
  var apiService = ApiService();
  late Future<List<Movie>> downloadedMovies;

  //u ovoj klasi se zove funkcija opisana u api.dart - npr. getPopularMovie()
  // Neznam jel se moze ovako?

}

// class CastLoader with ChangeNotifier {
//   List<Cast> castedActors = ApiService().getCastList(movieId) as List<Cast>;
// }
