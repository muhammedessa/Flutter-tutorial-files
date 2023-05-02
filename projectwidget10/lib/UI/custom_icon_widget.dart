import 'package:flutter/material.dart';

class CustomIconWidget extends StatelessWidget{
  const CustomIconWidget({Key? key,}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: InkWell(
        onTap: (){},
        borderRadius: BorderRadius.circular(50),
        highlightColor: Colors.deepOrange.withOpacity(0.4),
        splashColor: Colors.blue.withOpacity(0.5),
        child: const Icon(Icons.ac_unit_sharp,size: 90,),
      ),
    );
  }
}