import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: const Text("Second page"),
      ),
      body: const Center(
        child:  Text('Second page',style: TextStyle(fontSize: 30),),
      ),
    );
  }
}



