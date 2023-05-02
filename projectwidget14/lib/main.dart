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
      body:  Center(
        child: Column(
          children:  [
            const  SizedBox(  height: 20, ),

              IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.ac_unit)),

            const SizedBox(  height: 20, ),
            const CircleAvatar(
              radius: 120,
              backgroundColor: Colors.deepPurple,
            child: CircleAvatar(
              radius: 100,
              // backgroundColor: Colors.deepPurple,
              backgroundImage: NetworkImage('https://www.vhv.rs/dpng/d/426-4263064_circle-avatar-png-picture-circle-avatar-image-png.png'),
            ),
            ),
            const  SizedBox(  height: 20, ),
            const  CircleAvatar(
              radius: 80,
              backgroundColor: Colors.deepPurple,
              child:
                Text(
                  '100',
                  style: TextStyle(
                      fontSize: 30,
                    color: Colors.deepOrange
                  ),
                ),
            ),


            // const  Text('Begin'),
            // const SizedBox(  height: 20, ),
            //  ElevatedButton(
            //     onPressed: (){},
            //     child: const Text('Click me')),
            //  SizedBox(
            //   width: 300,
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       shadowColor: Colors.deepPurple,
            //       elevation: 10,
            //       minimumSize: const Size(250, 300)
            //     ),
            //       onPressed: () {  },
            //       child: const Text('Click me')),
            // ),
            // const SizedBox(  height: 20, ),
            // Row(
            //   children: const[
            //     Icon(Icons.ac_unit,size: 25,),
            //     Expanded(
            //         child: Icon(Icons.ac_unit,size: 25,),
            //     ),
            //     Icon(Icons.ac_unit,size: 25,),
            //     Expanded(
            //       child: Icon(Icons.ac_unit,size: 25,),
            //     ),
            //     Expanded(
            //       child: Icon(Icons.ac_unit,size: 25,),
            //     ),
            //
            //   ],
            // ),
            // const Spacer(), // Defaults to a flex of one.
            // const  Text('Middle'),
            // // Gives twice the space between Middle and End than Begin and Middle.
            // const Spacer(flex: 2),
            // const Text('End'),
            // const Spacer(flex: 3),
            // const Text('End'),

            // const Icon(Icons.ac_unit,size: 25,),
            // Spacer(flex: 2,),
            // const Icon(Icons.add_alert,size: 25,),

            // Stack(
            //   children: [
            //     Container(
            //       width: 300,
            //       height: 200,
            //       color: Colors.blue,
            //     ),
            //     Container(
            //       width: 250,
            //       height: 150,
            //       color: Colors.deepOrange,
            //     ),
            //     Container(
            //       width: 150,
            //       height: 100,
            //       color: Colors.deepPurple,
            //     ),
            //   ],
            // ),
          ],
        )

  ),
     );
  }
}
