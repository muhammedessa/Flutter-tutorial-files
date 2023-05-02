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

    return MaterialApp(
      home:  Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body:   ListView(
            children:  [
              const SizedBox(height: 20,),
              const Center(
                child:  Text("Employees",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight:
                      FontWeight.bold),),
              ),
              DataTable(
                  columns: const[
                    DataColumn(label: Text("Id")),
                    DataColumn(label: Text("Name")),
                    DataColumn(label: Text("Age")),
                  ],
                  rows: const [
                   DataRow(
                       cells:[
                       DataCell( Text("1") ),
                       DataCell( Text("Muhammed") ),
                       DataCell( Text("39") ),
                      ]
                   ),
                    DataRow(
                        cells:[
                          DataCell( Text("2") ),
                          DataCell( Text("Ali") ),
                          DataCell( Text("42") ),
                        ]
                    ),
                    DataRow(
                        cells:[
                          DataCell( Text("3") ),
                          DataCell( Text("Osama") ),
                          DataCell( Text("40") ),
                        ]
                    ),

                  ]
              ),
 
            ],
          ),
        ),
    );
  }
}
