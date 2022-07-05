import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_pattern/models/models.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserLoading()) {
    on<LoadUser>(_onLoadUser);
    on<AddUser>(_onAddUser);
    on<DeleteUser>(_onDeleteUser);
    on<UpdateUser>(_onUpdateUser);
  }

  void _onLoadUser(LoadUser event, Emitter<UserState> emit) {}
  void _onAddUser(AddUser event, Emitter<UserState> emit) {}
  void _onDeleteUser(DelteUser event, Emitter<UserState> emit) {}
  void _onUpdateUser(UpdateUser event, Emitter<UserState> emit) {}
}
