import 'package:flutter/material.dart';
import 'package:projectwidget11/mywidgets/my_card_widget.dart';
import 'package:projectwidget11/mywidgets/my_icon_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Padding(

        padding: EdgeInsets.symmetric(
            horizontal:width * 0.1 ,vertical: height * 0.1
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            MyCardWidget(),
            MyIconWidget(),
          ],
        ),
      ),

    );
  }
}
