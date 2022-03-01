import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../models/movie.dart';
import '../models/movie_detail.dart';
import '../models/movie_image.dart';
import '../models/cast.dart';

class ApiService {
  final Dio _dio = Dio();

  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = 'api_key=9255ffc5e139073439509722ad5733c7';

  Future<List<Movie>> getPopularMovie(int page) async {
    //tu bi kao arugment trebao primiti paginaciju
    print('u api.dartu page je ${page}');
    try {
      final url =
          '$baseUrl/movie/popular?$apiKey&page=$page'; //tu u nastavku dodati /$page (po defaultu je 1)
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception('getPopularMovie');
    }
  }
  /**var list = response.data['cast'] as List; //ovo se izvrši
      print(list.length);
      List<Cast> castList = [];
      for (var i = 0; i < 10; i++) {
        //print(list[i]['name']);
        var filler = new Cast(
            name: list[i]['name'],
            profilePath: list[i]['profile_path'],
            character: list[i]['character']);
        castList.add(filler);

        print(castList[i].name.toString());
      }

      return castList;**/

  Future<MovieImage> getMovieImage(int movieId) async {
    try {
      final response = await _dio.get('$baseUrl/movie/$movieId/images?$apiKey');
      return MovieImage.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception('getMovieImage');
    }
  }

  Future<List<Cast>> getCastList(int movieId) async {
    try {
      final url = '$baseUrl/movie/$movieId/credits?$apiKey';
      final response = await _dio.get(url);

      var list = response.data['cast'] as List; //ovo se izvrši
      print(list.length);
      List<Cast> castList = [];
      for (var i = 0; i < 10; i++) {
        //print(list[i]['name']);
        if (list[i]['name'] != null &&
            list[i]['profile_path'] != null &&
            list[i]['character'] != null) {
          var filler = new Cast(
              name: list[i]['name'],
              profilePath: list[i]['profile_path'],
              character: list[i]['character']);
          castList.add(filler);

          print(castList[i].name.toString());
        }
      }

      return castList;
    } catch (error, stacktrace) {
      throw Exception('getCastList');
    }
  }
}
