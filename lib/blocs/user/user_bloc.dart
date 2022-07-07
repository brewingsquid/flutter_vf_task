import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
import '../../models/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  // list to store the data
  List<User> listUser = [];
  // for now use UserLoaded instead UserLoading
  UserBloc() : super(UserLoaded()) {
    // use those methods to control data input
    // on<LoadUser>(_onLoadUser);
    on<AddUser>(_onAddUser);
    on<DeleteUser>(_onDeleteUser);
    // on<UpdateUser>(_onUpdateUser);
  }

  // void _onLoadUser(LoadUser event, Emitter<UserState> emit) {}
  void _onAddUser(AddUser event, Emitter<UserState> emit) {
    final state = this.state;
    if (state is UserLoaded) {
      User user = User(name: event.name, birthday: event.birthDate);
      listUser.add(user);
      emit(UserLoaded(user: listUser));
    }
  }

  void _onDeleteUser(DeleteUser event, Emitter<UserState> emit) {}
  // void _onUpdateUser(UpdateUser event, Emitter<UserState> emit) {}
}
