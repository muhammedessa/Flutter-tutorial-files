import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectwidget38/backend_api/posts_repo.dart';
import 'package:projectwidget38/blocs/app_blocs.dart';
import 'package:projectwidget38/models/post.dart';

import '../blocs/app_events.dart';
import '../blocs/app_states.dart';

class EditPostPage extends StatefulWidget {
  final String id;
  const EditPostPage({super.key, required this.id });


  @override
  State<EditPostPage> createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage> {


  final TextEditingController _title = TextEditingController();
  final TextEditingController _body = TextEditingController();
  final TextEditingController _userId = TextEditingController();

  String postId = '';

  @override
  void initState() {
    postId = widget.id.toString();
    PostRepository().getPostById(int.parse(postId)).then((value) {
      _title.value = TextEditingValue(text: value.title.toString());
      _body.value = TextEditingValue(text: value.body.toString());
      _userId.value = TextEditingValue(text: value.id.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => PostBloc(PostRepository()),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Page'),
        ),
        body: SafeArea(
          child: Scaffold(
            body: Container(
              padding:  const EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                   Text('id: ${widget.id?.toString()} ',style: const TextStyle(fontSize: 21),),
                  const SizedBox(height: 20,),
                  const Text('title',style: TextStyle(fontSize: 21),),
                  TextFormField(controller: _title,),
                  const Text('body',style: TextStyle(fontSize: 21),),
                  TextFormField(controller: _body,),
                  const Text('user id',style: TextStyle(fontSize: 21),),
                  TextFormField(controller: _userId,),

                  BlocBuilder<PostBloc,PostState>(
                      builder: (context, state){
                        return ElevatedButton(
                            onPressed: (){
                              if(
                              _title.text.isNotEmpty &&
                                  _body.text.isNotEmpty&&
                                  _userId.text.isNotEmpty){
                                context.read<PostBloc>().add(
                                    UpdatePostEvent(
                                       post: PostModel(
                                         title:_title.text ,body:_body.text ,id: int.parse(_userId.text)
                                       )
                                    )
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  duration: Duration(seconds: 1),
                                    content:  Text('Post update successfully'))
                                );
                                context.read<PostBloc>().add(LoadPostEvent());
                                Navigator.pop(context);
                              }else{
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                    content:  Text('Please fields are required!'))
                                );
                              }
                            },
                            child: const Text('Update Post')
                        );
                      }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
