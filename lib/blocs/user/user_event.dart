part of 'user_bloc.dart';

import 'dart:html';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUser extends UserEvent {
  final List<User> user;

  const LoadUser({this.user = const <user>[]});

  @override
  List<Object> get props => [user];
}

class AddUser extends UserEvent {
  final User user;
  const AddUser({required this.user});

  @override
  List<Object> get props => [user];
}

class UpdateUser extends UserEvent {
  final User user;
  const AddUser({required this.user});

  @override
  List<Object> get props => [user];
}

class DeleteUser extends UserEvent {
  final User user;
  const AddUser({required this.user});

  @override
  List<Object> get props => [user];
}
