import 'package:flutter/material.dart';
import 'package:tmdb_move_app/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       brightness: Brightness.dark,
       primaryColor: Colors.green
      ),
      home:Home(), 
    );
  }
}

