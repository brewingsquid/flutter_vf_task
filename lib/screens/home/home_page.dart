import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vf_task/blocs/user/user_bloc.dart';
import 'package:intl/intl.dart';

import '../../models/user_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // variable
  TextEditingController birthdateField = TextEditingController();
  TextEditingController nameField = TextEditingController();
  int _counter = 0;

  // method
  void pickDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
        // birthdateField.text = DateFormat('yyyy-MM-dd – kk:mm').format(value!);
        birthdateField.text = DateFormat('dd.MM.yyyy').format(value!);
      });
    });
  }

  void _addToList() {
    setState(() {
      _counter++;
    });
  }

  // UI
  @override
  Widget build(BuildContext context) {
    // linking to the bloc
    List<User> listUser = BlocProvider.of<UserBloc>(context).listUser;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const CircularProgressIndicator();
          } else if (state is UserLoaded) {
            return Container(
              constraints: const BoxConstraints.expand(),
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: ListView(
                children: [
                  SizedBox(height: 20.00),
                  Text(
                    'Let\'s rock the Usecase!',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 20.00),
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade300,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: listUser.isEmpty
                        ? Center(
                            child: Text('please add some user'),
                          )
                        : Expanded(
                            flex: 1,
                            child: ListView.builder(
                              itemCount: state.user!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 10,
                                    ),
                                    leading: CircleAvatar(
                                      radius: 32,
                                      backgroundColor: Colors.blue,
                                    ),
                                    title: Text(
                                        '${state.user![index].name}  ${state.user![index].birthday}'),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        context.read<UserBloc>().add(DeleteUser(
                                            user: state.user![index]));
                                      },
                                      tooltip: 'Delete User',
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  ),

                  SizedBox(height: 20.0),
                  // MySquare(),
                  SizedBox(height: 20.00),
                  TextFormField(
                    controller: nameField,
                    decoration: InputDecoration(labelText: 'your name'),
                  ),
                  SizedBox(height: 20.0),
                  /*GestureDetector(
                onTap: () => pickDate(),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(birthdateField.text == ''
                          ? 'Seclect Birthday'
                          : birthdateField.text),
                      const Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),*/
                  TextField(
                    controller: birthdateField,
                    decoration: InputDecoration(
                      labelText: 'your date',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: pickDate,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 60.0),
                  GestureDetector(
                    onTap: () {
                      context.read<UserBloc>().add(AddUser(
                          name: nameField.text,
                          birthDate: birthdateField.text));
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          'ADD USER',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _addToList,
        tooltip: 'add item into list',
        child: const Icon(Icons.add),
      ),*/
    );
  }
}
