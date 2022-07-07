import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vf_task/blocs/user/user_bloc.dart';
import 'package:flutter_vf_task/screens/home/home_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: MyHomePage(title: 'Data Strong App'),
    );
  }
}
