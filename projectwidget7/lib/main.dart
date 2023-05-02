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
            Container(
              margin: const EdgeInsets.all(20.0),
              child: Table(
                border: TableBorder.all(color: Colors.deepOrange),
                children:  [
                  TableRow(
                    children: [
                      Column(
                        children: const [
                          Icon(Icons.add_alert,size: 20.0,),
                          Text('Muhammed'),
                        ],),
                      Column(
                        children: const [
                          Icon(Icons.access_time_filled,size: 20.0,),
                          Text('Essa'),
                        ],),
                      Column(
                        children: const [
                          Icon(Icons.accessibility_new,size: 20.0,),
                          Text('Hameed'),
                        ],),
                    ]
                  ),
                  const TableRow(
                    children:  [
                      Icon(Icons.accessibility_new,size: 20.0,),
                      Icon(Icons.accessibility_new,size: 20.0,),
                      Icon(Icons.accessibility_new,size: 20.0,),
                    ]
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
     );
  }
}
