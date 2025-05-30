
import 'package:flutter/material.dart';
import 'package:tmdb_move_app/description.dart';
import 'package:tmdb_move_app/utils/text.dart';

class TopratedMovies extends StatelessWidget {
  const TopratedMovies({
    Key? key,
    required this.toprated,
  }) : super(key: key);
   final List toprated;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: 'Top Rated Movies ', size: 26.0),
          SizedBox(height: 10,),
          Container(height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:toprated.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => Description(
                              name: toprated[index]['title'],
                              description:
                                  toprated[index]['overview'] != null
                                      ? toprated[index]['overview']
                                      : 'Loading',
                              bannerurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                  toprated[index]['backdrop_path'],
                              posterurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                  toprated[index]['poster_path'],
                              vote:
                                  toprated[index]['vote_average']
                                      .toString(),
                              launch_on:
                                  toprated[index]['release_date'],
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
                          image: DecorationImage(image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500' + toprated[index]['poster_path'],
                          ),
                          ))
                        ),
                        Container(
                          child: modified_text(text: toprated[index]['title'] != null ? toprated[index]['title'] : 'Loading',),
                        )
                      
                    ],
                  ),
                ),

              );
            } ),)
        ],
      ),
    );
  }
}
