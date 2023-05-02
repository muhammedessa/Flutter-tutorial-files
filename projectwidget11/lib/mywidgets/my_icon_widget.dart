import 'package:flutter/material.dart';

class MyIconWidget extends StatefulWidget {
  const MyIconWidget({Key? key, }): super(key:key);



  @override
  State<MyIconWidget> createState() => _MyIconWidgetState();
}

class _MyIconWidgetState extends State<MyIconWidget> {

  bool  isSelected  = false;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        setState(() {
          isSelected = !isSelected;
        });},
      onLongPress:(){
        debugPrint('onLongPress activated !');
      } ,
      onDoubleTap:(){debugPrint('onDoubleTap activated !');} ,
      child:  Icon(
        isSelected? Icons.add_alert_sharp : Icons.ac_unit,
        size: isSelected? 80: 90,
        color: isSelected? Colors.blue : Colors.amber,
      ),
    );
  }
}
