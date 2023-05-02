import 'package:flutter_bloc/flutter_bloc.dart';
import '../backend_api/posts_repo.dart';
import '../models/post.dart';
import 'app_events.dart';
import 'app_states.dart';

class PostBloc extends Bloc<PostEvent, PostState> {

  final PostRepository _postRepository;
  PostBloc(this._postRepository):super(PostLoadingState()){
    on<LoadPostEvent>((event, emit) async{
      emit(PostLoadingState());
      print('loading is done');
      try{
       final posts =  await _postRepository.getPosts();
        emit(PostLoadedState(posts));
       print('data is ready');
      }catch(e){
        emit(PostErrorState(e.toString()));
        print('error occur');
      }
    });

    on<AddPostEvent>((event, emit) async{
      await _postRepository.createPost(
          PostModel(
              id: event.userId ,
              title:event.title ,
              body:event.body  )
      );
    });

    on<UpdatePostEvent>((event, emit) async{
      await _postRepository.updatePost( event.post );
    });


    on<FetchSpecificPostEvent>((event, emit) async{
      PostModel post = await _postRepository.getPostById(event.id);
      emit(PostSpecificState(post));
    });

    on<DeletePostEvent>((event, emit) async{
      await _postRepository.deletePost( event.id );
      add(LoadPostEvent());
    });

  }

}