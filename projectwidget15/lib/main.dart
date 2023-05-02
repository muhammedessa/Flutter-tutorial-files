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

bool myvalue1 = false;
bool myvalue2 = false;


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
            const SizedBox(height: 20,),
            const Text('Please check the below boxes'),
            CheckboxListTile(
              title: const Text('Are you sleeping'),
                subtitle: const Text('is it ok for you'),
                value:  myvalue1,
                onChanged: (bool? value){
                  setState(() {
                     myvalue1 = value!;

                  });
                },
            ),
            CheckboxListTile(
              title: const Text('Are you eating'),
              subtitle: const Text('is it ok for you'),
              value: myvalue2,
              onChanged: (bool? value){
                setState(() {
                  myvalue2 = value!;
                });
              },
            ),
            const SizedBox(height: 40,),
            Center(
              child: Text("$myvalue1"),
            ),
          ],
        ),
   ),
     );
  }
}
