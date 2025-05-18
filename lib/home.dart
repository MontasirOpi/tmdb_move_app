import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:tmdb_move_app/utils/text.dart';
import 'package:tmdb_move_app/widgets/popular.dart';
import 'package:tmdb_move_app/widgets/toprateted.dart';
import 'package:tmdb_move_app/widgets/trending.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topratedMovies = [];
  List popularMovies = [];
  final String apikey = '02ac75188d3b89a61c54c3dd2d42d0be';
  final String redAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMmFjNzUxODhkM2I4OWE2MWM1NGMzZGQyZDQyZDBiZSIsIm5iZiI6MTc0NzU1MjYyOC4xODIwMDAyLCJzdWIiOiI2ODI5ODk3NDlkNTcyZWZlYzYwYmQyZjciLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.FPG2evzXp0QDFKTiPVHrvt_Kr0B4-sXCGX8s8pG7ycs';
  
  @override
  void initState() {
    super.initState();
    loadMovies();
  }
  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, redAccessToken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map popularResult = await tmdbWithCustomLogs.v3.movies.getPopular();
    setState(() {
      trendingMovies = trendingResult['results'];
      topratedMovies = topratedResult['results'];
      popularMovies = popularResult['results'];
    });
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title:  modified_text(text:'TMDB Movie App', size: 20.0),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          PopularMovies(popular: popularMovies),
          TopratedMovies(toprated: topratedMovies),
          TrendingMovies(trending:trendingMovies)
        ],
      ),
    );
  }
}
