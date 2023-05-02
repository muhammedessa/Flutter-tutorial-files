import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectwidget32/sql_helper.dart';

class EditRecord extends StatefulWidget{
  final String id;
  const EditRecord({super.key, required this.id});

  @override
  State<EditRecord> createState()=> _EditRecordState();
}

class _EditRecordState extends State<EditRecord> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _updateItem() async {
    await SQLHelper.updateItem(
        int.parse(widget.id),  _titleController.text, _descriptionController.text);
  }

  Future<void> _getItem() async {
    var data = await SQLHelper.getItem( int.parse(widget.id) );
    _titleController.text = data[0]["title"] as String ;
    _descriptionController.text = data[0]["description"] as String  ;
  }


  @override
  void initState() {
    super.initState();
    _getItem();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Book'),
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
                  _updateItem();
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
