import 'package:flutter/material.dart';
import 'package:tmdb_move_app/description.dart';
import 'package:tmdb_move_app/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({Key? key, required this.trending})
    : super(key: key);
  final List trending;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: 'Trending Movies ❤️', size: 26.0),
          SizedBox(height: 10),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => Description(
                              name: trending[index]['title'],
                              description:
                                  trending[index]['overview'] != null
                                      ? trending[index]['overview']
                                      : 'Loading',
                              bannerurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                  trending[index]['backdrop_path'],
                              posterurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                  trending[index]['poster_path'],
                              vote:
                                  trending[index]['vote_average']
                                      .toString(),
                              launch_on:
                                  trending[index]['release_date'],
                            ),
                      ),
                    );
                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['poster_path'],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: modified_text(
                            text:
                                trending[index]['title'] != null
                                    ? trending[index]['title']
                                    : 'Loading',
                          ),
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
