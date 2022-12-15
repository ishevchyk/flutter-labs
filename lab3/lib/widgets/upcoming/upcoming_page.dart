import 'package:flutter/material.dart';

import '../shared/movie_details.dart';

class UpcomingPage extends StatelessWidget {
  final List moviesData;

  const UpcomingPage({super.key, required this.moviesData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('upcoming'),
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
