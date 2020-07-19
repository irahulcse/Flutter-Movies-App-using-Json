import 'package:flutter/material.dart';
import 'package:flutter_movies_application/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MoviesListView(),
      debugShowCheckedModeBanner: false,
      title: "Flutter Movies Application",
      
    );
  }
}
