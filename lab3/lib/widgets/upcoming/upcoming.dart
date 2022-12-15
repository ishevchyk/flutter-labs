import 'package:flutter/material.dart';

import '../shared/button.dart';
import 'upcoming_page.dart';

class UpcomingMovies extends StatelessWidget {
  final List upcomingMovies;

  const UpcomingMovies({super.key, required this.upcomingMovies});
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
                  'Upcoming',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Button(
                  page: UpcomingPage(moviesData: upcomingMovies),
                )
              ],
            ),
          ),
          SizedBox(
              height: 220,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: upcomingMovies.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 160,
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 3),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${upcomingMovies[index]['poster_path']}',
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
