

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectwidget32/sql_helper.dart';

class AddRecord extends StatefulWidget{
  const AddRecord({super.key});
  
  @override
  State<AddRecord> createState()=> _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {

final TextEditingController _titleController = TextEditingController();
final TextEditingController _descriptionController = TextEditingController();
   
  Future<void> _addItem() async {
    await SQLHelper.createItem(_titleController.text, _descriptionController.text); 
  }
 


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Book'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'title',
                  border: OutlineInputBorder(),
                  labelText: 'Title'
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              margin: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                    hintText: 'description',
                    border: OutlineInputBorder(),
                    labelText: 'description'
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Center(
              child: ElevatedButton(
                onPressed: (){
                  _addItem();
                  _titleController.text = '';
                  _descriptionController.text = '';
                  Navigator.pop(context,'refresh');
                  
                },
                child: const Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
