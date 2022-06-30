import 'package:flutter/material.dart';
import 'package:flutter_vf_task/square.dart';
import 'model/user_model.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ----------------------------------------------------------------//

  // variable
  TextEditingController birthdateField = TextEditingController();
  TextEditingController nameField = TextEditingController();
  int _tappedCounter = 0;
  int _counter = 0;
  List<User> listUser = [];

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Form(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20.00),
              Text(
                'Let\'s rock the Usecase!',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey,
                ),
              ),
              MySquare(),
              SizedBox(height: 20.0),
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
                  setState(() {
                    listUser.add(User(
                        name: nameField.text, birthday: birthdateField.text));
                  });
                  print('item added to listUser: $listUser');
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  color: Colors.blue,
                  child: Text(
                    'ADD USER',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addToList,
        tooltip: 'qee item into list',
        child: const Icon(Icons.add),
      ),
    );
  }
}
