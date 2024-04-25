import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/model/description.dart';

class Nowplaying extends StatelessWidget {
  final List nowplaying;
  const Nowplaying({super.key, required this.nowplaying});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Now playing", style: TextStyle(color: Colors.white)),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: nowplaying.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //add func
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: nowplaying[index]['title'],
                          // ignore: prefer_interpolation_to_compose_strings
                          bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                              nowplaying[index]['backdrop_path'],
                          // ignore: prefer_interpolation_to_compose_strings
                          posterUrl: 'https://image.tmdb.org/t/p/w500' +
                              nowplaying[index]['poster_path'],
                          description: nowplaying[index]['overview'],
                          launchOn: nowplaying[index]['release_date'],
                          vote: nowplaying[index]['vote_average'].toString(),
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
                                nowplaying[index]['title'] != null
                                    // ignore: prefer_interpolation_to_compose_strings
                                    ? 'https://image.tmdb.org/t/p/w500' +
                                        nowplaying[index]['poster_path']
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
                          nowplaying[index]['title'] ?? "Loading",
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
