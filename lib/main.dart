import 'package:flutter/material.dart';
import 'package:flutter_vf_task/screens/home/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // initialize hive
  await Hive.initFlutter();
  runApp(const MyApp());

  // open the box
  var box = await Hive.openBox('mybox');
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
      home: const HomeScreen(),
    );
  }
}
