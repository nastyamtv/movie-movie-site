import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/model/description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Trending movies", style: TextStyle(color: Colors.white)),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //add func
                    trending[index]['title'] != null
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Description(
                                name: trending[index]['title'],
                                // ignore: prefer_interpolation_to_compose_strings
                                bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['backdrop_path'],
                                // ignore: prefer_interpolation_to_compose_strings
                                posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['poster_path'],
                                description: trending[index]['overview'],
                                launchOn: trending[index]['release_date'],
                                vote:
                                    trending[index]['vote_average'].toString(),
                              ),
                            ),
                          )
                        : const SizedBox.shrink();
                  },
                  child: trending[index] != null
                      ? SizedBox(
                          width: 140,
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      trending[index]['title'] != null
                                          // ignore: prefer_interpolation_to_compose_strings
                                          ? 'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['poster_path']
                                          // ignore: prefer_interpolation_to_compose_strings
                                          : 'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['poster_path'],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                trending[index]['title'] ?? "Loading",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )
                      : Container(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
