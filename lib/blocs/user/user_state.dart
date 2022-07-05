part of 'user_bloc.dart';


import 'dart:html';

import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserLoading extends UserState{}

class UserLoaded extends UserState{
  final List<User> user;

  const TodosLoaded({this.user = const <User>[]});

  @override
  List<Object> get props => [user];
}