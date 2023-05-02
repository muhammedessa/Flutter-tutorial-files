import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void _saveData()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
       prefs.setString('name', myName.text);
    });

  }

  void _getData()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myNameDefault =  (prefs.getString('name') ?? 'No data');
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }


  String myNameDefault = 'Hello';
  TextEditingController myName = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20.0,),
            Container(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: myName,
                decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'place you name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              child: Text(myNameDefault),
            ),
            const SizedBox(height: 20.0,),
            ElevatedButton(
                onPressed: _saveData,
                child:const Text('Save')),
          ],
        ),
   ),
     );
  }
}
