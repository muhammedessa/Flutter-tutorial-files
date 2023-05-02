import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
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
      home: SplashScreen(
        seconds: 8,
        navigateAfterSeconds: const MyHomePage(title: 'Flutter Demo Home Page'),
        title: const Text('This is my Splash Screen',
          style: TextStyle(
              fontWeight: FontWeight.bold,
            fontSize: 23.0,
            color: Colors.white
          ),
        ),
        image:  Image.asset('assets/images/4.png'),
        photoSize: 100.0,
        backgroundColor: Colors.deepPurple,
        styleTextUnderTheLoader: TextStyle(),
        loaderColor: Colors.deepOrange,
      ),
    );
  }
}

