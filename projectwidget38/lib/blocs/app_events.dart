import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:projectwidget38/models/post.dart';

@immutable
abstract class PostEvent extends Equatable{}

class LoadPostEvent extends PostEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class AddPostEvent extends PostEvent{
  final String title;
  final String body;
  final int  userId;

  AddPostEvent(
      { required this.title,
        required this.body,
        required this.userId
      } );

  @override
  // TODO: implement props
  List<Object?> get props => [title, body,userId];

}

class UpdatePostEvent extends PostEvent{
  final PostModel post;
  UpdatePostEvent( { required this.post  } );
  @override
  // TODO: implement props
  List<Object?> get props => [post];
}

class FetchSpecificPostEvent extends PostEvent{
  final int id;
  FetchSpecificPostEvent( { required this.id  } );
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class DeletePostEvent extends PostEvent{
  final int id;
  DeletePostEvent( { required this.id  } );
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}