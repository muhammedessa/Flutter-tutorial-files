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
      home: const MyHomePage(title: 'Muhammed Essa hameed'),
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
        title: const Text('Muhammed Essa'),
        actions: [
          IconButton(
              onPressed: (){
                ScaffoldMessenger.
                of(context)
                    .showSnackBar(
                 const SnackBar(
                        content:  Text('Muhammed Essa')
                    )
                );
                //debugPrint('Hello Muhammed');
              },
              icon: const Icon(Icons.add_alert),

          )
        ],
      ),

      body: const Center(
        child:  Text(
          "Hello world",
          style: TextStyle(fontSize: 22.0),
        ),
      ),
    );

  }
}
