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

        title: const Text('Muhammed Essa'),
      ),
      body:  Center(

        child:  Container(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            child: const Text('Click me'),
            onPressed: (){
              ScaffoldMessenger.of(context).showMaterialBanner(
               const MaterialBanner(
                  content: Text('Hello, Muhammed Essa'),
                 backgroundColor: Colors.pink,
                 leading: Icon(Icons.ac_unit_outlined),
                 actions: <Widget>[
                   TextButton(
                     onPressed: null,
                     child: Text('DISMISS'),
                   ),
                 ],
                  ),
              );


            },
          ),
        )
      ),
      );
  }
}
