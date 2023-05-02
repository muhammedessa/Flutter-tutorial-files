import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:projectwidget31/screens/info_screen.dart';

import 'Model/person.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  await Hive.openBox('peopleBox');
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key });


  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  @override
  void dispose() {
    // TODO: implement dispose
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hive',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:   InfoScreen(),
    );
  }
}
