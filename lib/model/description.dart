import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String name, description, bannerUrl, posterUrl, launchOn, vote;

  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerUrl,
      required this.posterUrl,
      required this.launchOn,
      required this.vote});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Description"),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerUrl, fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                    left: 10,
                    bottom: 10,
                    child: Text("Rating $vote",
                        style: const TextStyle(color: Colors.white)))
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              name != null ? name : "laoding",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "released on$launchOn" != null ? launchOn : "laoding",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                height: 200,
                width: 100,
                child: Image.network(posterUrl),
              ),
              Flexible(
                child: Text(
                  description != null ? description : "loading",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
