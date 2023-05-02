import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

List _items = [];

Future<void> readJson() async{
  final String response = await rootBundle.loadString('assets/posts.json');
  final data = await json.decode(response);
  setState(() {
    _items = data["posts"];
  });
}

@override
  void initState() {
    // TODO: implement initState
  readJson();
  super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextButton(
                onPressed: (){
                  readJson();
                },
                child: Text('Click me')
            ),

            _items.isNotEmpty?  Expanded(
                child: ListView.builder(
                    itemBuilder: (context,index){
                      return Card(
                        key: ValueKey(_items[index]["id"]),
                        margin: const EdgeInsets.all(10.0),
                        color: Colors.greenAccent,
                        child: ListTile(
                          leading: Text(_items[index]["id"].toString()),
                          title: Text(_items[index]["title"]),
                          subtitle: Text(_items[index]["body"]),
                        ),
                      );
                    }
                ),
            )
                :Container(),
          ],
        ),
    ),
     );
  }
}
