import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget{
  const CustomImageWidget({Key? key,}) : super(key:key);

  @override
  Widget build(BuildContext context) {

    showSnackBar(String gesture){
      var snackbar = SnackBar(content: Text('You click $gesture'));
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }

    // TODO: implement build
    return Ink(
      width: double.infinity,
      height: 330,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: const DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1622899505135-694e8ccffce8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bmF0dXJlJTIwaW1hZ2VzfGVufDB8fDB8fA%3D%3D&w=1000&q=80'
              ),
              fit: BoxFit.fill
          ),
      ),

      child: InkWell(
        onTap: (){showSnackBar('you  onTap');},
        onDoubleTap: (){showSnackBar('you  onDoubleTap');},
        onLongPress: (){showSnackBar('you  onLongPress');},
        borderRadius: BorderRadius.circular(30),
        highlightColor: Colors.deepOrange.withOpacity(0.4),
      ),
    );
  }
}