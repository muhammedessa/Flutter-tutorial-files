import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body:  SafeArea(
        child: Column(
          children: [

            SingleChildScrollView(
              child: Container(
                height: 300,
                child: Carousel(
                  boxFit: BoxFit.fill,
                  images: const [
                    AssetImage('assets/images/1.jpg'),
                    AssetImage('assets/images/2.jpg'),
                    AssetImage('assets/images/3.jpg'),
                    AssetImage('assets/images/4.jpg'),
                  ],
                  autoplay: false,
                  dotColor: Colors.yellow,
                //  dotBgColor: Colors.black,
                  dotSize: 5.0,
                  dotSpacing: 20.0,
                ),
              ),
            ),

            const Center(
              child:  Text("Muhammed Essa" ,
                style: TextStyle(
                  fontFamily: 'AlexBrush',
                  fontSize: 40,
                  color: Colors.teal,
                ),
              ),
            ),
          ],
        ),
      ),
      );
  }
}
