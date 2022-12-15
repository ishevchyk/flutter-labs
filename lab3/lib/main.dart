import 'package:flutter/material.dart';
import 'package:lab3/widgets/popular/popular.dart';
import 'package:lab3/widgets/top/top_rated.dart';
import 'package:lab3/widgets/upcoming/upcoming.dart';

import 'movies_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF2B3033),
          secondary: const Color(0xFFEAD0D0),
        ),
      ),
      home: const MyHomePage(title: 'Movies App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List topRated = [];
  List popular = [];
  List upcoming = [];

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  loadMovies() async {
    List popularMovies = await MovieService().getPopularMovies();
    List topRatedMovies = await MovieService().getTopMovies();
    List upcomingMovies = await MovieService().getUpcomingMovies();

    setState(() {
      topRated = topRatedMovies;
      popular = popularMovies;
      upcoming = upcomingMovies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          title: Text(
            widget.title,
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 26),
          ),
        ),
        body: Container(
          color: const Color(0xFFFDEFEF),
          child: ListView(
            children: [
              PopularMovies(popularMovies: popular),
              TopRatedMovies(topRatedMovies: topRated),
              UpcomingMovies(upcomingMovies: upcoming)
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
