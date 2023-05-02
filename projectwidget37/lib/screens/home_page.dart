import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectwidget37/Models/data_model.dart';
import 'package:projectwidget37/blocs/app_states.dart';
import '../blocs/app_events.dart';
import '../backend_api/users_repository.dart';
import '../blocs/app_blocs.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
     return MultiBlocProvider(
       providers: [
         BlocProvider(
             create: (BuildContext context) => UserBloc(UserRepository()),
         )
       ],
       child: Scaffold(
         appBar: AppBar(title:  const Text('Hello'),),
         body: BlocProvider(
           create: (context)=> UserBloc(UserRepository())..add(LoadUserEvent()),
           child: BlocBuilder<UserBloc, UserState>(
             builder: (context, state){
               if(state is UserLoadingState){
                 return const Center(child: CircularProgressIndicator(),);
               }
               if(state is UserErrorState){
                 return const Center(child: Text('Error'),);
               }
               if(state is UserLoadedState){
               //  return const Center(child: Text('Loaded state '),);
                 List<DataModel> userList = state.users;
                 return ListView.builder(
                   itemCount: userList.length,
                     itemBuilder: (_,index){
                     return Container(
                       padding:  const EdgeInsets.symmetric(vertical: 3,horizontal: 7),
                       child: Card(
                         color: Colors.amber,
                         child: ListTile(
                           title: Text('${userList[index].firstName} - ${userList[index].lastName}'
                           ,style: const TextStyle(color: Colors.deepPurple),),
                           subtitle: Text('${userList[index].maidenName}'
                             ,style: const TextStyle(color: Colors.deepPurple),),
                           leading: CircleAvatar(
                             backgroundImage: NetworkImage(userList[index].image.toString()),
                           ),
                         ),
                       ),
                     );
                     }
                 );
               }
               
               return Container();
             },
           ),
         ),
       ),
     );
  }
}