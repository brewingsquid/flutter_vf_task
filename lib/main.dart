import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VF Task Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Data Storing App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _addToList() {
    setState(() {
      _counter++;
    });
  }

  // ---------------------------------

  TextEditingController dateTime = TextEditingController();

  void pickDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    ).then((value) {
      setState(() {
        dateTime.text = DateFormat('yyyy-MM-dd – kk:mm').format(value!);
      });
    });
  }

  int tappedCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Form(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 80.00),
              Text(
                'Let\'s rock the Usecase!',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'your name'),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: dateTime,
                decoration: InputDecoration(
                  labelText: 'your date',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: pickDate,
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Text(
                'tapped ' + tappedCounter.toString() + ' times',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  setState(() {
                    tappedCounter++;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  color: Colors.blue,
                  child: Text(
                    'TAP HERE',
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
