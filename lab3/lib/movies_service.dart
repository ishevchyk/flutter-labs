import 'dart:convert';

import 'package:http/http.dart';

class MovieService {
  Future<List> getTopMovies() async {
    // try {
    Response response = await get(Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=b5331ef6be93663f760a4f2ddd0c6c78&language=en-US&page=2'));
    return jsonDecode(response.body)['results'];
  }

  Future<List> getPopularMovies() async {
    // try {
    Response response = await get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=b5331ef6be93663f760a4f2ddd0c6c78&language=en-US&page=1'));
    return jsonDecode(response.body)['results'];
  }

  Future<List> getUpcomingMovies() async {
    // try {
    Response response = await get(Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=b5331ef6be93663f760a4f2ddd0c6c78&language=en-US&page=1'));
    return jsonDecode(response.body)['results'];
  }
}
