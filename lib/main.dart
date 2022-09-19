import 'package:flutter/material.dart';
import 'package:movies/core/serveces/services_locator.dart';
import 'package:movies/movies/presentaion/screens/movies_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        textTheme: const TextTheme(
          subtitle1: TextStyle(color: Colors.white)
        ),
        primarySwatch: Colors.blue,
      ),
      home: const MoviesScreen(),
    );
  }
}


