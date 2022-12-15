import 'package:flutter/material.dart';
import 'package:lab3/widgets/top/top_rated_page.dart';

import '../shared/button.dart';

class TopRatedMovies extends StatelessWidget {
  final List topRatedMovies;

  const TopRatedMovies({super.key, required this.topRatedMovies});
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
                  'Top Rated',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Button(
                  page: TopRatedPage(moviesData: topRatedMovies),
                )
              ],
            ),
          ),
          SizedBox(
              height: 220,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topRatedMovies.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 160,
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 3),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${topRatedMovies[index]['poster_path']}',
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
