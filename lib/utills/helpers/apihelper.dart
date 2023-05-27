import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movieapp_viva/models/moviemodel.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();

  // String apikey -"a4869947-221e-4eda-9a62-b1b30ad780d7"

  // String url = "https://www.omdbapi.com/?t=baghi&apikey=eff65df7";
 // "http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$search&Surat"

  Future<MovieModel?> fetchallmovie({required String search}) async {
    String baseurl = "https://www.omdbapi.com/?t=$search&Baaghi&apikey=eff65df7";


    // String baseurl = "https://www.omdbapi.com/?s=$search&Baaghi&apikey=eff65df7";
    http.Response res = await http.get(
      Uri.parse(baseurl),
    );

    if (res.statusCode == 200) {
      String data = res.body;

      Map decodeddata = jsonDecode(data);

      MovieModel allMoviedata = MovieModel.fromMap(
        data: decodeddata,
      );
      return allMoviedata;
    }
  }
}
////
