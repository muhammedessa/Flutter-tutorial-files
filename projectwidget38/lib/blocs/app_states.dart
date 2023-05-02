import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../models/post.dart';

@immutable
abstract class PostState extends Equatable{}


class PostLoadingState extends PostState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PostLoadedState extends PostState{
  final List<PostModel> posts;
  PostLoadedState(this.posts);
  @override
  List<Object?> get props => [posts];
}

class PostErrorState extends PostState{
  final String error;
  PostErrorState(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}



class PostSpecificState extends PostState{
  final PostModel post;
  PostSpecificState(this.post);
  @override
  // TODO: implement props
  List<Object?> get props => [post];
}

