
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../Model/person.dart';

class AddPersonForm extends StatefulWidget {
  const AddPersonForm({super.key});


  @override
  State<AddPersonForm> createState() => _AddPersonFormState();
}

class _AddPersonFormState extends State<AddPersonForm> {

  final  _nameController = TextEditingController();
  final  _countryController = TextEditingController();
  final _personFormKey = GlobalKey<FormState>();

  late final Box box;

  String? _fieldValidator(String? value){
    if(value == null || value.isEmpty){
      return 'Field is required';
    }
    return null;
  }

  _addInfo() async{
    Person newPerson = Person(
      name:_nameController.text,
      country: _countryController.text
    );
    box.add(newPerson);
    print('Added successfully');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    box =   Hive.box('peopleBox');
  }

  @override
  Widget build(BuildContext context) {

    return Form(
       key: _personFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Name'),
          TextFormField(
            controller: _nameController,
            validator: _fieldValidator,
          ),

          const SizedBox(height: 24.0,),
          const Text('Country'),
          TextFormField(
            controller: _countryController,
            validator: _fieldValidator,
          ),
          const  Spacer(),
          Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 24.0),
            child: Container(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  if(_personFormKey.currentState!.validate()){
                    _addInfo();
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('save'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
