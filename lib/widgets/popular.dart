
import 'package:flutter/material.dart';
import 'package:tmdb_move_app/description.dart';
import 'package:tmdb_move_app/utils/text.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({
    Key? key,
    required this.popular,
  }) : super(key: key);
   final List popular;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: 'Popular Movies ', size: 26.0),
          SizedBox(height: 10,),
          Container(height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:popular.length,
            itemBuilder: (context, index) {
              return InkWell(
               onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => Description(
                              name: popular[index]['title'],
                              description:
                                  popular[index]['overview'] != null
                                      ? popular[index]['overview']
                                      : 'Loading',
                              bannerurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                  popular[index]['backdrop_path'],
                              posterurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                  popular[index]['poster_path'],
                              vote:
                                  popular[index]['vote_average']
                                      .toString(),
                              launch_on:
                                  popular[index]['release_date'],
                            ),
                      ),
                    );
                  },
                child: Container(
                  padding: EdgeInsets.all(5),
                  width: 250,
                  child: Column(
                    children: [
                      Container(
                        
                        width: 250,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500' + popular[index]['backdrop_path'],
                          ),
                          fit: BoxFit.cover
                          ))
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: modified_text(text: popular[index]['title'] != null ? popular[index]['title'] : 'Loading',),
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
