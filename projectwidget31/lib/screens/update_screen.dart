import 'package:flutter/material.dart';
import '../Model/person.dart';
import '../utils/update_person_form.dart';

class UpdateScreen extends StatefulWidget {

  final int index;
  final Person person;

  const UpdateScreen({
    super.key, required this.index, required this.person});




  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Update person'),
      ),
      body:  Padding(
          padding: const EdgeInsets.all(15.0),
        child:   UpdatePersonForm(
            index: widget.index,
            person: widget.person
        ),
      ),
    );
  }
}
