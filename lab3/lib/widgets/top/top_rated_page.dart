import 'package:flutter/material.dart';

import '../shared/movie_details.dart';

class TopRatedPage extends StatelessWidget {
  final List moviesData;

  const TopRatedPage({super.key, required this.moviesData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('top rated'),
      ),
      body: SizedBox(
          height: double.infinity,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: moviesData.length,
              itemBuilder: (context, index) {
                return MovieDetails(movie: moviesData[index]);
              })),
    );
  }
}
