import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/movie_provider.dart';


class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key });


  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {

  @override
  Widget build(BuildContext context) {

     var myList = context.watch<MovieProvider>().myList;

     return Scaffold(
       appBar: AppBar(
         title: Text('Favorite ${myList.length}', ),
       ),
      body:ListView.builder(
          itemCount: myList.length,
          itemBuilder: (_,index) {
            final currentMovie = myList[index];
            return Card(
              key: ValueKey(currentMovie.title),
              color: Colors.deepPurple,
              elevation: 4,
              child: ListTile(
                title: Text(currentMovie.title),
                subtitle: Text(currentMovie.runtime ?? 'No data'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_forever_sharp,
                    color: Colors.red, size: 25,),
                  onPressed: () {
                    context.read<MovieProvider>().removeFromList(currentMovie);
                  },
                ),
              ),
            );
          }),
    );

  }
}
