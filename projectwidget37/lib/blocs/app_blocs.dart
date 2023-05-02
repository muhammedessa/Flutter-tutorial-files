import 'package:bloc/bloc.dart';

import '../backend_api/users_repository.dart';
import 'app_events.dart';
import 'app_states.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  final UserRepository userRepository;
  UserBloc(this.userRepository) : super(UserLoadingState()){
    on<LoadUserEvent>((event,emit) async {
      emit(UserLoadingState());
      print('UserLoadingState is done');
      try{
        final users = await userRepository.getUsers();
        emit(UserLoadedState(users));
        print('UserLoadedState is done');
      }catch(e){
        emit(UserErrorState(e.toString()));
      }
    });
  }

}