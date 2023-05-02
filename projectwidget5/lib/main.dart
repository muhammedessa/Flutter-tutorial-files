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

  final List<String> entries = <String>['Ahmed', 'Bassim', 'Camiliya', 'Dhafer', 'Emad', 'Fuad'];
  final List<int> colorCodes = <int>[600, 500, 100,600, 500, 100];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.blue[colorCodes[index]],
              child: Center(child: Text(' ${entries[index]}')),
            );
          }
 
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
