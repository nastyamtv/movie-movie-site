import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/model/menu_item.dart';
import 'package:movie_recommendation_app/screens/report_screen.dart';
import 'package:movie_recommendation_app/widgets/menu_items.dart';
import 'package:movie_recommendation_app/widgets/now_playing.dart';
import 'package:movie_recommendation_app/widgets/toprated_movies.dart';
import 'package:movie_recommendation_app/widgets/trending_movies.dart';
import 'package:movie_recommendation_app/widgets/upcoming.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tmdb_api/tmdb_api.dart';
// import 'package:movie_recommendation_app/utils/text_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingMovies = [];
  List topratedMovies = [];
  // List topratedTv = [];
  List upcomimg = [];
  List nowplayinglist = [];
  final String apikey = 'fe82242bc46fe1861236bcb1bb659808';
  final token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZTgyMjQyYmM0NmZlMTg2MTIzNmJjYjFiYjY1OTgwOCIsInN1YiI6IjY0ODQ5OWE2ZTM3NWMwMDBhY2M1NGMxOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qi0oX-MHhiQyMCYqhu6bb5jbFDhNEd-2qUKcw33CruU';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, token),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending(
        // language: 'te',
        // mediaType: MediaType.movie,
        );
    Map topratedmoviesresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map upcomingresult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    Map nowplaying = await tmdbWithCustomLogs.v3.movies.getNowPlaying();
    // Map topratedtvresult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      // topratedTv = topratedtvresult['results'];
      trendingMovies = trendingresult['results'];
      topratedMovies = topratedmoviesresult['results'];
      upcomimg = upcomingresult['results'];
      nowplayinglist = nowplaying['results'];
    });

    // print(trendingMovies);
    // print(topratedMovies);
    // print(upcomingresult);
    // print(nowplayinglist);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          actions: [
            PopupMenuButton<MenuItem>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                ...MenuItems.items.map(buildItem).toList(),
              ],
            )
          ],
          title: const Text("🎬 Movie Movie"),
          backgroundColor: Colors.blueAccent[300],
        ),
        body: ListView(
          children: [
            // TopratedTv(Tv: topratedTv),
            UpcomingMovies(upcoming: upcomimg),
            Nowplaying(nowplaying: nowplayinglist),
            TopratedMovies(topRated: topratedMovies),
            TrendingMovies(trending: trendingMovies),
            // const Center(
            //   child: Padding(
            //     padding: EdgeInsets.only(bottom: 10),
            //     child: Text(
            //       "Show More",
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 20,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem(
        value: item,
        child: Row(
          children: [
            Icon(
              item.icon,
              color: Colors.black,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              item.title,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      );
  void onSelected(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.reportItem:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Reportbug(),
          ),
        );
        break;
      case MenuItems.shareItem:
        const url = 'https://openinapp.co/yasiy';
        Share.share(
            'Explore the Latest Blockbusters 🎥, Highest-Rated Films 🌟, and Exciting Upcoming Releases 🚀 in the world of cinema! 🍿🎬🌟 at :$url');
        break;
    }
  }
}
