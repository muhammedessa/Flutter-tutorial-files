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
      body: Center(
        child: Column(
          children: [
           const SizedBox(height: 30,),
            Container(
              height: 140,width: 140,
              alignment: Alignment.center ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              boxShadow: const [
                BoxShadow(color: Colors.amber,
                    blurRadius: 5,
                    spreadRadius: 2,
                offset: Offset(5,5))
              ],
              color: Colors.deepPurple
            ),
              child: const Text('Muhammed'),
            ),
            const SizedBox(height: 30,),
            Container(
              height: 140,width: 140,
              alignment: Alignment.center ,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  boxShadow: const [
                    BoxShadow(color: Colors.amber,
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: Offset(5,5))
                  ],
                  color: Colors.blueAccent
              ),
              child: const Text('Muhammed'),
            ),
            const SizedBox(height: 30,),
            Container(
              height: 140,width: 140,
              alignment: Alignment.center ,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  boxShadow: const [
                    BoxShadow(color: Colors.amber,
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: Offset(5,5))
                  ],
                  color: Colors.lightGreen
              ),
              child: const Text('Muhammed'),
            ),
          ],
        ),
      ),
        );
  }
}
