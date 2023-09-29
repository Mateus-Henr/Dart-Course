import 'package:flutter/material.dart';
import 'package:teste/page/movie_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("IMDb Movies App"))),
        body: const MovieListPage(),
      ),
    );
  }
}
