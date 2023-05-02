import 'dart:math';

import 'package:flutter/material.dart';

class MyCardWidget extends StatefulWidget {
  const MyCardWidget({Key? key, }): super(key:key);


  @override
  State<MyCardWidget> createState() => _MyCardWidgetState();
}

class _MyCardWidgetState extends State<MyCardWidget> {

Color mybgColor = Colors.deepOrange;

  @override
  Widget build(BuildContext context) {

    return  GestureDetector(
      onDoubleTap: (){
        setState(() {
          mybgColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
        });
      },
      child: Card(
        child: const SizedBox(
          height: 300,
          width: 400,
        ),
        color: mybgColor,
      ),
    );
  }
}
