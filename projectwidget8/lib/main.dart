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

    return  DefaultTabController(
        length: 2,
        child: Scaffold(

          appBar:  AppBar(
            bottom: const TabBar(
              tabs:  [
                Tab(icon: Icon(Icons.accessibility_new),text: 'Tab1',),
                Tab(icon: Icon(Icons.access_time_filled),text: 'Tab2',),
              ],
            ),
            title: const Text('my Application'),
          ),
          body:   TabBarView(
            children:   [
              const Center(
                child: Text(
                  'my tab1',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    fontStyle: FontStyle.italic
                  ),
                ),
              ),
              Center(
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30,),
                    const Text('Please select Yes or No'),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: (){}, child:const Text('Yes')),
                        TextButton(onPressed: (){}, child:const Text('No'))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            foregroundColor:Colors.blue ,
            backgroundColor: Colors.orange,
            hoverColor:Colors.deepPurple ,
            child: const Icon(Icons.add),
            onPressed: (){
              
            },
          ),
        ),
    );
  }
}
