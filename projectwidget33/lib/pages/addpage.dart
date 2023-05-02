import 'package:flutter/material.dart';
import 'package:projectwidget33/service/firebase_crud.dart';

import 'listpage.dart';

class AddPage extends StatefulWidget {

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {


  final _employee_name = TextEditingController();
  final _employee_position = TextEditingController();
  final _employee_contact = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
               Padding(
                   padding: const EdgeInsets.all(16.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     TextField(
                         controller: _employee_name,
                         autofocus: false,
                         decoration: InputDecoration(
                             hintText: "Name",
                             border:
                             OutlineInputBorder(borderRadius: BorderRadius.circular(9.0)))),
                     const SizedBox(height: 35.0),
                     TextField(
                         controller: _employee_position,
                         autofocus: false,
                         decoration: InputDecoration(
                             hintText: "Position",
                             border:
                             OutlineInputBorder(borderRadius: BorderRadius.circular(9.0)))),
                     const SizedBox(height: 35.0),
                     TextField(
                         controller: _employee_contact,
                         autofocus: false,
                         decoration: InputDecoration(
                             hintText: "Contact Number",
                             border:
                             OutlineInputBorder(borderRadius: BorderRadius.circular(9.0)))),
                     const SizedBox(height: 35.0),
                     TextButton(
                         onPressed: (){
                           Navigator.pushAndRemoveUntil(context,
                               MaterialPageRoute(builder: (context)=>ListPage()), (route) => false);
                         },
                         child: const Text('List of Employees')),
                     const SizedBox(height: 35.0),
                     ElevatedButton(
                         onPressed: () async{
                           if (_employee_name.text == null || _employee_name.text.trim().isEmpty) {
                             ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                                 content:   Text('Please put values') ));
                           }
                           if (_employee_position.text == null || _employee_position.text.trim().isEmpty) {
                             ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                                 content:   Text('Please put values') ));
                           }
                           if (_employee_contact.text == null || _employee_contact.text.trim().isEmpty) {
                             ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                                 content:   Text('Please put values') ));
                           }else{
                             var response = await FirebaseCrud
                                 .addEmployee(
                                 name: _employee_name.text,
                                 position: _employee_position.text,
                                 contactno: _employee_contact.text);
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
                         child: Text('Save',
                           style: TextStyle(
                               color: Theme.of(context).primaryColorLight)
                           ,textAlign: TextAlign.center,)
                     ),
                   ],
                 ),
               ),
             ],
      ),
    );
  }
}
