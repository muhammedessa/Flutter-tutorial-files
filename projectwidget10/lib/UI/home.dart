
import 'package:flutter/material.dart';
import 'package:projectwidget10/UI/custom_button_widget.dart';
import 'package:projectwidget10/UI/custom_icon_widget.dart';
import 'package:projectwidget10/UI/image_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: const Text('Home page'),
      ),
      body:  Container(
        padding: const EdgeInsets.all(24.0),
        child:   Column(
          children: const [
            CustomImageWidget(),
            CustomButtonWidget(),
            CustomIconWidget(),
          ],
        ),
      ),
    );
  }
}
