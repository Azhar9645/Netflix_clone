import 'dart:async';
import 'dart:convert';

import 'package:netflix_clone/model.dart/movie.dart';
import 'package:http/http.dart' as http;

class MovieServices {
  static const nowplaying =
      "https://api.themoviedb.org/3/movie/now_playing?api_key=22c00e908dbff10456903a1f488b8085";
  static const popular =
      "https://api.themoviedb.org/3/movie/popular?api_key=22c00e908dbff10456903a1f488b8085";
  static const toprated =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=22c00e908dbff10456903a1f488b8085";
  static const upcoming =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=22c00e908dbff10456903a1f488b8085";

  static Future<List<Movie>> getNowplaying() async {
    int maxtries = 3;
    int mintries = 0;
    while (mintries < maxtries) {
      try {
        final response = await http.get(Uri.parse(nowplaying));
        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body)['results'];
          return data
              .map((json) => Movie.fromJson(json))
              .toList()
              .cast<Movie>();
        }
      } catch (e) {
        print('error in calling');
      }
      mintries++;
    }

    return [];
  }

  static Future<List<Movie>> getpopular() async {
    int maxtries = 3;
    int mintries = 0;
    while (mintries < maxtries) {
      try {
        final response = await http.get(Uri.parse(popular));
        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body)['results'];
          return data
              .map((json) => Movie.fromJson(json))
              .toList()
              .cast<Movie>();
        }
      } catch (e) {
        print('error in calling');
      }
      mintries++;
    }

    return [];
  }

  static Future<List<Movie>> gettoprated() async {
    int maxtries = 3;
    int mintries = 0;
    while (mintries < maxtries) {
      try {
        final response = await http.get(Uri.parse(toprated));
        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body)['results'];
          return data
              .map((json) => Movie.fromJson(json))
              .toList()
              .cast<Movie>();
        }
      } catch (e) {
        print('error in calling');
      }
      mintries++;
    }

    return [];
  }

  static Future<List<Movie>> getupcoming() async {
    int value1 = 0;
    int value2 = 3;
    while (value1 < value2) {
      try {
        final response = await http.get(Uri.parse(upcoming));
        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body)['results'];
          return data
              .map((json) => Movie.fromJson(json))
              .toList()
              .cast<Movie>();
        }
      } catch (e) {
        print('error in calling');
      }
      value1++;
    }
    return [];
  }
}
