import 'package:flutter/material.dart';

import '../shared/button.dart';
import 'popular_page.dart';

class PopularMovies extends StatelessWidget {
  final List popularMovies;

  const PopularMovies({super.key, required this.popularMovies});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Popular',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
                Button(
                  page: PopularPage(moviesData: popularMovies),
                )
              ],
            ),
          ),
          SizedBox(
              height: 220,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularMovies.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 160,
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 3),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${popularMovies[index]['poster_path']}',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
