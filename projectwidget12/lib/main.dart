import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  String displayText = 'Muhammed Essa';

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: Scaffold(
        backgroundColor: Colors.yellow,
        body: SafeArea(
          bottom: false,
          child: SizedBox.expand(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white
              ),
              // child: Text('Muhammed Essa',
              //   style: Theme.of(context).textTheme.displayLarge,),
              child: Column(
                children:  [
                  const  SizedBox(height: 20.0,),
                  TextField(
                    maxLength: 2,
                    // obscureText: true,
                    // obscuringCharacter: '*',
                    // keyboardType: TextInputType.emailAddress,
                    controller: textEditingController2,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Enter you name",
                      hintStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.blue,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none
                      ),
                    ),
                  ),
                  // const  SizedBox(height: 20.0,),
                  // // TextField(
                  // //   controller: textEditingController,
                  // //   maxLines: 8,
                  // //   style: const TextStyle(color: Colors.white),
                  // //   decoration: InputDecoration(
                  // //     hintText: "Enter you message",
                  // //     hintStyle: const TextStyle(color: Colors.white),
                  // //     filled: true,
                  // //     fillColor: Colors.deepOrange,
                  // //     border: OutlineInputBorder(
                  // //       borderRadius: BorderRadius.circular(20.0),
                  // //       borderSide: BorderSide.none
                  // //     ),
                  // //   ),
                  // // ),
                  // const  SizedBox(height: 40.0,),
                  // Text(displayText, style:const TextStyle(fontSize: 20),),
                  // const  SizedBox(height: 40.0,),
                  // ElevatedButton(
                  //     onPressed: (){
                  //       setState(() {
                  //         displayText = textEditingController.text;
                  //       });
                  //     },
                  //     child: Text('Click to change'))
                ],
              ),
            ),
          ),
        ),
      ) ,
    );
  }
}
