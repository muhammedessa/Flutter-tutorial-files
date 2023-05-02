import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../Models/data_model.dart';

@immutable
abstract class UserState extends Equatable{}

class UserLoadingState extends UserState{
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserState{
  final List<DataModel> users;
  UserLoadedState(this.users);
  @override
  List<Object?> get props => [users];
}

class UserErrorState extends UserState{
  final String error;
  UserErrorState(this.error);
  @override
  List<Object?> get props => [error];
}