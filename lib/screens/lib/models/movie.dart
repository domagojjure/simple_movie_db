import 'package:flutter/material.dart';

class Movie {
  final String backdropPath;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final int voteCount;
  final String voteAverage;

  Movie({
    this.backdropPath = '',
    this.id = -1,
    this.originalLanguage = '',
    this.originalTitle = '',
    this.overview = '',
    this.popularity = 0.0,
    this.posterPath = '',
    this.releaseDate = '',
    this.title = '',
    this.video = false,
    this.voteCount = 0,
    this.voteAverage = '',
  });

  factory Movie.fromJson(dynamic json) {
    if (json == null) {
      return Movie();
    }
    return Movie(
        backdropPath: json['backdrop_path'],
        id: json['id'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2' +
            json[
                'poster_path'], // e sad o ovom moramo popricat jer ovo je takva gimnastika da ja nemogu vjeroavat
        releaseDate: json['release_date'],
        title: json['title'],
        video: json['video'],
        voteCount: json['vote_count'],
        voteAverage: json['vote_average'].toString());
  }
}
