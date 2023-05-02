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
          children:[
            const Text('Muhammed',style: TextStyle(fontSize: 20),),
            const Text('Essa',style: TextStyle(fontSize: 20),),
            const Text('Hameed',style: TextStyle(fontSize: 20),),
            const Icon(Icons.coffee,size: 50.0,color: Colors.lightGreen,),
            const Icon(Icons.ac_unit_outlined,size: 50.0,color:Colors.deepPurple),
            const Icon(Icons.access_time_filled,size: 50.0,color:Colors.green),
            const Icon(Icons.accessibility_outlined,size: 50.0,color:Colors.amber),
            const SizedBox(height: 20),
            Container(
              height: 200,
              width: 300,
              color: Colors.pink,
              alignment: Alignment.center,
              child: const Text("Hello Container"),
            ),

          ],
        ),
      ),

       );
  }
}
