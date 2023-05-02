import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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

enum Fruit {apple,orange, banana}

class _MyHomePageState extends State<MyHomePage> {

  Fruit? _fruit = Fruit.apple;

  bool isSwitched = false;

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
           const Text('Please choose one'),
           const SizedBox(height: 20,),
            ListTile(
              title: const Text('Apple'),
              leading: Radio<Fruit>(
                value: Fruit.apple,
                groupValue: _fruit,
                onChanged: (Fruit? value){
                  setState(() {
                    _fruit = value;
                  });

                },
              ),
            ),
            ListTile(
              title: const Text('Orange'),
              leading: Radio<Fruit>(
                value: Fruit.orange,
                groupValue: _fruit,
                onChanged: (Fruit? value){
                  setState(() {
                    _fruit = value;
                  });

                },
              ),
            ),
            ListTile(
              title: const Text('Banana'),
              leading: Radio<Fruit>(
                value: Fruit.banana,
                groupValue: _fruit,
                onChanged: (Fruit? value){
                  setState(() {
                    _fruit = value;
                  });

                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                      const  SnackBar(content: Text('You chose banana')));

                },
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  debugPrint('You click me');
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    const  SnackBar(content: Text('You click me')));
                },
                child:const  Text('Click me')
            ),

            TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: (){
                  debugPrint('You click me');
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                      const  SnackBar(content: Text('You click me')));
                },
                child: const Text('You click me')),

            OutlinedButton(
                  onPressed: (){
                    debugPrint('You click me');
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                    const  SnackBar(content: Text('You click me')));
                    },
                child: const Text('You click me')
            ),
            Row(
              children: const[
                  Text('Muhammed'),
                  SizedBox(width: 10,),
                  Text('ALi'),
                  SizedBox(width: 10,),
                  Text('Osama'),
                  Icon(Icons.coffee ,
                  color: Colors.cyanAccent,
                size: 70.0,),
                  Icon(Icons.ac_unit_outlined ,
                  color: Colors.orange,
                  size: 70.0,),
              ],
            ),
            Switch(value: isSwitched,
                onChanged: (value){
              setState(() {
                isSwitched = value;
              });

            //  debugPrint('You : $value');
              ScaffoldMessenger.of(context)
                  .showSnackBar(
                    SnackBar(content: Text('You : $value')));

                }
            ),
          ],
        ),
       ),
      );
  }
}
