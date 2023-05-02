import 'package:flutter/material.dart';
import 'package:projectwidget29/provider/movie_provider.dart';
import 'package:projectwidget29/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider <MovieProvider>(
        child: const MyApp(),
      create: (_)=>MovieProvider(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(title: 'Home Screen',),
    );
  }
}
