import 'package:flutter/material.dart';

import '../utils/add_person_form.dart';


class AddScreen extends StatefulWidget {
  const AddScreen({super.key});


  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Add person'),
      ),
      body: const Padding(
          padding: EdgeInsets.all(15.0),
        child: AddPersonForm(),
      ),
    );
  }
}
