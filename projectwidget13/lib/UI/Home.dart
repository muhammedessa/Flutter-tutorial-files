import 'package:flutter/material.dart';

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
      body:  Container(
        decoration: const BoxDecoration(
          image:  DecorationImage(
            image: 
            //AssetImage('assets/images/image1.jpeg'),
            NetworkImage("https://images.unsplash.com/photo-1574169208507-84376144848b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1158&q=80"),
            fit: BoxFit.cover,
          )
        ),

        child: const Center(
         child:  Text('Muhammed Essa'),
        ),
      ),

      // Center(
      //   child: Image.asset("assets/images/image1.jpeg" ,
      //   height: 200,
      //    // scale: 3,
      //    // opacity: const AlwaysStoppedAnimation<double>(0.5),
      //   ),
      // ),
    );
  }
}