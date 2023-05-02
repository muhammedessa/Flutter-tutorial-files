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

        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,

          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text('Muhammed'),
              color: Colors.pink,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text('Muhammed'),
              color: Colors.amber,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text('Muhammed'),
              color: Colors.green,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text('Muhammed'),
              color: Colors.blueAccent,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text('Muhammed'),
              color: Colors.greenAccent,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text('Muhammed'),
              color: Colors.tealAccent,
            ),
          ],
        ),

        ),
       );
  }
}
