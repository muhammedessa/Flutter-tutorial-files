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

  DateTimeRange? _selectedDateRange ;

  void _show()async{
    final DateTimeRange? result = await showDateRangePicker(
        context: context,
        firstDate: DateTime(2023,1,1), lastDate: DateTime(2033,1,1),
        currentDate: DateTime.now(),
      saveText: 'Done',
    );

    if(result !=null){
      print(result.start.toString());
      setState(() {
        _selectedDateRange = result;
      });
    }
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: _selectedDateRange == null
        ?const Center(
        child: Text('Please pick date') ,
      ):Padding(
          padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Start date : ${_selectedDateRange?.start.toString().split('   ')}'
              ,style: const TextStyle(fontSize: 25,color: Colors.deepPurple),),
            const SizedBox(height: 30,),
            Text('End date : ${_selectedDateRange?.end.toString().split('   ')}'
              ,style: const TextStyle(fontSize: 25,color: Colors.deepOrange),),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _show,
        child: const Icon(Icons.date_range),
      ),
     );
  }
}
