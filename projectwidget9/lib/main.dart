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


  int _index = 0;
  List imitation_Game_Quotes = [
    'You cant leave, I wont let you. ',
    'You know to pull off this irascible genius routine, one has to actually be a genius.',
    'While we develop a system to help you determine how much intelligence to act on. ',
    'Youll need a believable alternative source for all the pieces of information that you use ',
    'Youre not God, Alan. You dont get to decide who lives and who dies. ',
    'Some people thought we were at war with the Germans. Incorrect. We were at war with the clock.',
    'Are you trying to build your universal machine? '
  ];

  void _readQuotes(){
    setState(() {
      _index = _index+1;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello App'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
             child: Container(
               height: 300,
               width: 300,
               decoration: BoxDecoration(
                 color: Colors.deepPurple,
                 borderRadius: BorderRadius.circular(10.0),
               ),
               padding: const EdgeInsets.all(10.0),
               margin: const EdgeInsets.all(20.0),
               child:  Text(
                 imitation_Game_Quotes[_index % imitation_Game_Quotes.length],
                 style: const TextStyle(color: Colors.white),),
             ),
            ),
            const SizedBox(height: 20,),
            TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),

                ),
                onPressed: (){
                  _readQuotes();
                },
                child: const Text('Click me')
            ),

            const SizedBox(height: 20,),
            IconButton(
              icon: const Icon(Icons.volume_up),
              tooltip: 'Increase volume by 10',
              iconSize: 72,
              onPressed: () {
                _readQuotes();
              },
            ),

          ],
        ),

      ),
    );
  }
}
