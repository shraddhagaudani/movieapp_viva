import 'package:flutter/material.dart';

class MovieModel {
  String title;
  String year;
  String rated;
  String released;
  String gener;
  String director;
  String runtime;
  String writer;
  String actor;
  String lan;
  String country;
  String poster;
  String movietype;
  String response;

  MovieModel({
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.gener,
    required this.director,
    required this.runtime,
    required this.writer,
    required this.actor,
    required this.lan,
    required this.country,
    required this.poster,
    required this.movietype,
    required this.response,
  });

  factory MovieModel.fromMap({required Map data}){
    return MovieModel(title: data['Title'],
        year: data['Year'],
        rated: data['Rated'],
        released: data['Released'],
        gener: data['Genre'],
        director: data['Director'],
        runtime: data['Runtime'],
        writer: data['Writer'],
        actor: data['Actors'],
        lan: data['Language'],
        country: data['Country'],
        poster: data['Poster'],
        movietype: data['Type'],
        response: data['Response']);
  }
}
