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
            ElevatedButton(
                child: const  Text('Click me'),
                onPressed: (){
                  _showDialog(context);
                }
            ),
            ElevatedButton(
                child: const  Text('Click me'),
                onPressed: (){
                  _showAlertDialog(context);
                }
            ),
            ElevatedButton(
                child: const  Text('Click me'),
                onPressed: (){
                  _showSimpleDialog(context);
                }
            ),
          ],
        ),
      ),
     );
  }
}

void _showDialog(BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const  Text('Alert !!'),
          content: const Text('Hello you are welcome'),
          actions: [
             TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: const   Text('Ok'),)
          ],
        );
      }
  );
}


Future<void> _showAlertDialog(BuildContext context) async{
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const  Text('Alert !!'),
          content:  SingleChildScrollView(
            child: ListBody(
              children:const [
                Text('Are you sure logout'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: const   Text('Ok'),),
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: const   Text('Cancel'),)
          ],
        );
      }
  );
}

Future<void> _showSimpleDialog(BuildContext context) async{
  showDialog(
      context: context,
      builder: (BuildContext context){
        return SimpleDialog(
          title: const  Text('SimpleDialog !!'),
          children:  [
            SimpleDialogOption(
              onPressed:   (){
                   Navigator.of(context).pop();
                },
              child: const Text('Yes'),
            ),
            SimpleDialogOption(
              onPressed:   (){
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            SimpleDialogOption(
              onPressed:   (){
                Navigator.of(context).pop();
              },
              child: const Text('Maybe'),
            ),
          ]

        );
      }
  );
}