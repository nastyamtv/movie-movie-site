import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/model/description.dart';

class TopratedMovies extends StatelessWidget {
  final List topRated;
  const TopratedMovies({super.key, required this.topRated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Top Rated movies", style: TextStyle(color: Colors.white)),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topRated.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //add func
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: topRated[index]['title'],
                          // ignore: prefer_interpolation_to_compose_strings
                          bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                              topRated[index]['backdrop_path'],
                          // ignore: prefer_interpolation_to_compose_strings
                          posterUrl: 'https://image.tmdb.org/t/p/w500' +
                              topRated[index]['poster_path'],
                          description: topRated[index]['overview'],
                          launchOn: topRated[index]['release_date'],
                          vote: topRated[index]['vote_average'].toString(),
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                topRated[index]['title'] != null
                                    // ignore: prefer_interpolation_to_compose_strings
                                    ? 'https://image.tmdb.org/t/p/w500' +
                                        topRated[index]['poster_path']
                                    : 'https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg',
                                // 'https://image.tmdb.org/t/p/w500' +
                                //     topRated[index]['poster_path'],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          topRated[index]['title'] ?? "Loading",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
