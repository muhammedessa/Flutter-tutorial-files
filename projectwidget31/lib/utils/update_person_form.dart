
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../Model/person.dart';

class UpdatePersonForm extends StatefulWidget {
  const UpdatePersonForm({
    super.key, required this.index, required this.person});

  final int index;
  final Person person;

  @override
  State<UpdatePersonForm> createState() => _UpdatePersonFormState();
}

class _UpdatePersonFormState extends State<UpdatePersonForm> {

 late final  _nameController  ;
 late final  _countryController  ;
  final _personFormKey = GlobalKey<FormState>();
  late final Box box;

  String? _fieldValidator(String? value){
    if(value == null || value.isEmpty){
      return 'Field is required';
    }
    return null;
  }

  _updateInfo() async{
    Person newPerson = Person(
        name:_nameController.text,
        country: _countryController.text
    );
    box.putAt(widget.index,newPerson);
    print('updated successfully');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    box =   Hive.box('peopleBox');
    _nameController = TextEditingController(text:widget.person.name);
    _countryController = TextEditingController(text:widget.person.country);
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
                    _updateInfo();
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('update'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
