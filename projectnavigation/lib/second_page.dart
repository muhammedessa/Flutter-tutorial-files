
import 'package:flutter/material.dart';



class SecondPage extends StatelessWidget {
  final String name, email,phone;
   const  SecondPage(
      {super.key,
        required this.name,
        required this.email,
        required this.phone}
      );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: const Text("second page"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Your name is : $name'),
            Text('Your email is : $email'),
            Text('Your phone is : $phone'),

            TextButton(
              child: const Text('go back'),
              onPressed: (){
                Navigator.pushReplacementNamed(context, 'first');
                // Navigator.pop(context);
              },
            ),
          ],
        )

      ),
    );
  }
}