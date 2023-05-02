import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:projectwidget31/screens/add_screen.dart';
import 'package:projectwidget31/screens/update_screen.dart';

class InfoScreen extends StatefulWidget {

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {

 late final Box contactBox;

 _deleteInfo(int index){
   contactBox.deleteAt(index);
   print('the data is deleted');
 }

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contactBox = Hive.box('peopleBox');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('People'),
      ),
      body: ValueListenableBuilder(
        valueListenable: contactBox.listenable(),
        builder: (context,Box box,widget){
          if(box.isEmpty){
            return const Center(
              child: Text('No Data'),
            );
          }else{
           return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context,index){
                var currentBox = box;
                var personData = currentBox.getAt(index)!;
                return InkWell(
                  onTap: ()=> Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context)=>UpdateScreen(
                            index: index, person: personData),),
                  ),
                  child: ListTile(
                    title: Text(personData.name),
                    subtitle:Text(personData.country) ,
                    trailing: IconButton(
                      onPressed: ()=> _deleteInfo(index),
                      icon: const Icon(Icons.delete_forever),
                      color: Colors.red,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: ()=> Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>const AddScreen()),
        ),
      ),
    );
  }
}
