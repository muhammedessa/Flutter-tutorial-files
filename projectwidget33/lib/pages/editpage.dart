import 'package:flutter/material.dart';
import 'package:projectwidget33/service/firebase_crud.dart';

import '../models/employee.dart';
import 'listpage.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key, required this.employee});
  final Employee? employee;



  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _employee_name = TextEditingController();
  final _employee_position = TextEditingController();
  final _employee_contact = TextEditingController();
  final _docid = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _employee_name.value = TextEditingValue(text:widget.employee!.employeename.toString() );
      _employee_position.value = TextEditingValue(text:widget.employee!.position.toString());
      _employee_contact.value = TextEditingValue(text:widget.employee!.contactno.toString());
      _docid.value = TextEditingValue(text:widget.employee!.uid.toString());
  }




  @override
  Widget build(BuildContext context) {

    final DocIDField =  TextField(
      controller: _docid,
        readOnly: true,
      autofocus: false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'ID',
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
    );
    final nameField =  TextFormField(
      controller: _employee_name,
      autofocus: false,
      validator: (value){
        if(value == null || value.trim().isEmpty){
          return 'This field is required';
        }
      },
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Name',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
    );
    final positionField =  TextFormField(
      controller: _employee_position,
      autofocus: false,
      validator: (value){
        if(value == null || value.trim().isEmpty){
          return 'This field is required';
        }
      },
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Name',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
    );
    final contactField =  TextFormField(
      controller: _employee_contact,
      autofocus: false,
      validator: (value){
        if(value == null || value.trim().isEmpty){
          return 'This field is required';
        }
      },
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Name',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
    );
    final viewListButton = TextButton(
        onPressed: (){
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context)=>ListPage()), (route) => false);
        }, child: const Text('All Employees'),
    );
    final updateButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async{
          if(_formKey.currentState!.validate()){
            var  response = await FirebaseCrud
                .updateEmployee(
                name: _employee_name.text,
                position: _employee_position.text,
                contactno: _employee_contact.text,
                docId: _docid.text);
            if (response.code != 200) {
              ScaffoldMessenger.of(context).showSnackBar(  SnackBar(
                  content:   Text(response.message.toString())
              ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(  SnackBar(
                  content:   Text(response.message.toString())
              ));
            }
          }


        },
        child:Text('Update',
          style: TextStyle(
              color: Theme.of(context).primaryColorLight)
          ,textAlign: TextAlign.center,),
      ),
    );


    return Scaffold(
      appBar: AppBar(
        title: const Text('Add page'),
      ),
      body: Form(
        key: _formKey,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DocIDField,
              const SizedBox(height: 25.0,),
              nameField,
              const SizedBox(height: 25.0,),
              positionField,
              const SizedBox(height: 25.0,),
              contactField,
              const SizedBox(height: 25.0,),
              viewListButton,
              const SizedBox(height: 25.0,),
              updateButton
            ],
          ),
      ),
    );
  }
}
