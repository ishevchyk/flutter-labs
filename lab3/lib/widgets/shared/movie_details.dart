import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  final Map movie;
  const MovieDetails({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      child: Column(
        children: <Widget>[
          Center(
            child: Card(
              elevation: 4,
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
                fit: BoxFit.cover,
                height: 200,
                width: 160,
              ),
            ),
          ),
          Text(movie['title'],
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2,
                  fontSize: 30)),
          Text(movie['overview'],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                letterSpacing: 0.5,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Card(
                color: Colors.black,
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.calendar_month_rounded,
                      size: 40,
                      color: Colors.amber[100],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      movie['release_date'],
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 5,
                color: Colors.black,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.star_border,
                      size: 40,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      movie['vote_average'].toString(),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
