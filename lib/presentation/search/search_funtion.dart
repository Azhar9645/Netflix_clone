import 'dart:convert';

import 'package:netflix_clone/model.dart/movie.dart';
import 'package:http/http.dart' as http;


Future<List<Movie>> searchfunction(String query) async {
    const apiKey = '3f289ebadafa6f95104807f753f7d195';
    const baseUrl = 'https://api.themoviedb.org/3/search/movie';

    int maxtries = 3;
    int mintries = 0;
    while (maxtries > mintries) {
      try {
        final response =
            await http.get(Uri.parse('$baseUrl?api_key=$apiKey&query=$query'));

        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body)['results'];
          return data
              .map((json) => Movie.fromJson(json))
              .toList()
              .cast<Movie>();
        }
      } catch (e) {
        // ignore: avoid_print
        print('Error in fetching the data');
      }
      mintries++;
    }
    return [];
  }

  