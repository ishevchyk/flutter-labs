import 'package:flutter/material.dart';
import 'package:lab3/widgets/shared/movie_details.dart';

class PopularPage extends StatelessWidget {
  final List moviesData;

  const PopularPage({super.key, required this.moviesData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Popular'),
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
