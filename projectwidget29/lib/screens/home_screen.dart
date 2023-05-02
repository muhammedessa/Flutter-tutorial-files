import 'package:flutter/material.dart';
import 'package:projectwidget29/provider/movie_provider.dart';
import 'package:projectwidget29/screens/my_list_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    var movies = context.watch<MovieProvider>().movies;
    var myList = context.watch<MovieProvider>().myList;

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
                onPressed: (){
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                      builder: (context)=>const MyListScreen(),
                  )
                  );
                },
                icon: const Icon(Icons.favorite),
                label: Text('My favorite ${myList.length}'
                  ,style:const TextStyle(fontSize: 23),
                ),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrange,
                padding: const EdgeInsets.symmetric(vertical: 20),
              ),
            ),
            const SizedBox(height: 16,),
            Expanded(
                child: ListView.builder(
                  itemCount: movies.length,
                    itemBuilder: (_,index){
                    final currentMovie = movies[index];
                    return Card(
                      key: ValueKey(currentMovie.title),
                      color: Colors.deepPurple,
                      elevation: 4,
                      child: ListTile(
                        title: Text('${currentMovie.title}'),
                        subtitle: Text(currentMovie.runtime ??'No data'),
                        trailing: IconButton(
                          icon: Icon(Icons.favorite,
                          color: myList.contains(currentMovie)
                              ?Colors.deepOrange: Colors.white,size: 25,),
                          onPressed: (){
                            if(!myList.contains(currentMovie)){
                              context.read<MovieProvider>().addToList(currentMovie);
                            }else{
                              context.read<MovieProvider>().removeFromList(currentMovie);
                            }
                          },
                        ),
                      ),
                    );
                    }
                )
            ),

          ],
        ),

      ),
    );
  }
}
