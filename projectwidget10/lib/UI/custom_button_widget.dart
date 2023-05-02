import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget{
  const CustomButtonWidget({Key? key,}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: InkWell(
        onTap: (){},
        borderRadius: BorderRadius.circular(30),
        highlightColor: Colors.deepOrange.withOpacity(0.4),
        splashColor: Colors.blue.withOpacity(0.5),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
          ),
          child: const Text('My Btn',style: TextStyle(fontSize: 26),),
        ),
      ),
    );
  }
}