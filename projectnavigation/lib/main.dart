import 'package:flutter/material.dart';
import 'package:projectnavigation/Home.dart';
import 'package:projectnavigation/second_page.dart';

void main() {
  runApp(
    MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData(
  primarySwatch: Colors.blue,
  ),
  home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
    "first" : (context)=>const MyHomePage(title: 'Flutter Demo Home Page'),
    "second" : (context)=> const SecondPage(name: '',email: '',phone: ''),
      },
  ),

      );
}





