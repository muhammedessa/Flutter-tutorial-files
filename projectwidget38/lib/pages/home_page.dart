import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectwidget38/blocs/app_blocs.dart';
import 'package:projectwidget38/backend_api/posts_repo.dart';
import 'package:projectwidget38/models/post.dart';
import 'package:projectwidget38/pages/add_page.dart';

import '../blocs/app_events.dart';
import '../blocs/app_states.dart';
import 'edit_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key });


  @override
  Widget build(BuildContext context) {

     return MultiBlocProvider(
         providers: [
           BlocProvider(
               create: (BuildContext context)=>PostBloc(PostRepository())
           )
         ],
         child: Scaffold(
           appBar: AppBar(
             title: const Text("Posts"),
             actions: [
               IconButton(
                   onPressed: (){
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context)=>const AddPostPage())
                     );
                   },
                   icon: const Icon(Icons.add_circle_outline)
               )
             ],
           ),
           body: BlocProvider(
               create: (context)=>PostBloc(PostRepository())..add(LoadPostEvent()),
             child: BlocBuilder<PostBloc,PostState>(
               builder: (context,state){
                 if(state is PostLoadingState){
                   return const Center(child: CircularProgressIndicator(),);
                 }
                 if(state is PostLoadedState){
                   List<PostModel> postlist = state.posts;
                   return ListView.builder(
                     itemCount: postlist.length ,
                       itemBuilder: (_,index){
                       return Padding(
                             padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                         child: GestureDetector(
                           onTap: (){
                             Navigator.push(context,
                                 MaterialPageRoute(
                                     builder: (context)=>  EditPostPage(id: postlist[index].id.toString())
                                 )
                             );
                           },
                           child: Card(
                             color: Colors.deepPurple,
                             child: ListTile(
                               title: Text('${postlist[index].title}',
                                 style: const TextStyle(color: Colors.white),) ,
                               subtitle:Text('${postlist[index].body}',
                                 style: const TextStyle(color: Colors.white),) ,
                               leading: CircleAvatar(
                                 backgroundColor: Colors.orange,
                                 child: Text(postlist[index].id.toString()),
                               ),
                               trailing: IconButton(
                                 icon: const Icon(Icons.delete_forever_rounded,color: Colors.yellow,),
                                 onPressed: (){
                                   context.read<PostBloc>().add(DeletePostEvent(id: postlist[index].id!));
                                 },
                               ),
                             ),
                           ),
                         )
                         );
                       }
                   );
                 }
                 if(state is PostErrorState){
                   return const Center(child:  Text("Error"),);
                 }
                 return Container();
               },
             ),
           ),
         )

     );
  }
}
