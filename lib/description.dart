import 'package:flutter/material.dart';
import 'package:tmdb_move_app/utils/text.dart';

class Description extends StatelessWidget {
  final String name;
  final String description;
  final String bannerurl;
  final String posterurl;
  final String vote;
  final String launch_on;

  const Description({
    super.key,
    required this.name,
    required this.description,
    required this.bannerurl,
    required this.posterurl,
    required this.vote,
    required this.launch_on,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: modified_text(text: 'Movie Details', color: Colors.white, size: 20.0),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(bannerurl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
                  Positioned(
                    bottom: 10,
                    child: modified_text(text: ' ⭐ Average Rating - $vote', color: Colors.white, size: 16.0)),
                
                ],
              ),
            ),
            SizedBox(height: 16,),
            Container(
              padding: EdgeInsets.only(left: 16),
              child: modified_text(text: name, size: 26.0, color: Colors.white)),
              SizedBox(height: 16,),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: modified_text(text: 'Release Date - $launch_on', size: 16.0, color: Colors.white)),
                SizedBox(height: 16,),
                Container(
                  padding: EdgeInsets.only(left: 16),
                  child: modified_text(text: 'Overview', size: 26.0, color: Colors.white)),
                  SizedBox(height: 16,),
                  Container(
                    padding: EdgeInsets.only(left: 16),
                    child: modified_text(text: description, size: 16.0, color: Colors.white) ),

          ],
        ),
      ),
    );
  }
}
