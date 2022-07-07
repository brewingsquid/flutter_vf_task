part of 'user_bloc.dart';

abstract class UserState /* extends Equatable*/ {
  const UserState();

  // @override
  // List<Object> get props => [];
}

// state 1
class UserLoading extends UserState {}

// state 2
class UserFailed extends UserState {}

// state 3
class UserLoaded extends UserState {
  final List<User>? user;
  // with Equatable use line below
  // const UserLoaded({this.user = const <User>[]});
  const UserLoaded({this.user});

  // @override
  // List<Object> get props => [user!];
}
