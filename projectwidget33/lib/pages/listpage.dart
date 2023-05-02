import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectwidget33/models/employee.dart';
import 'package:projectwidget33/pages/addpage.dart';
import 'package:projectwidget33/pages/editpage.dart';
import 'package:projectwidget33/service/firebase_crud.dart';

class ListPage extends StatefulWidget {

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

 final Stream<QuerySnapshot> collectionReference = FirebaseCrud.readEmployee();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('List page'),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(
                        builder: (context)=>AddPage()), (route) => false);
              },
              icon: const Icon(Icons.add,color: Colors.orange,)
          )
        ],
      ),
      body:  StreamBuilder(
        stream: collectionReference,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasData){
            return Padding(
                padding: const EdgeInsets.only(top:8.0),
              child: ListView(
                children: snapshot.data!.docs.map((e){
                  return Card(
                    child: Column(
                    children: [
                      ListTile(
                    title: Text(e['employee_name']),
                        subtitle: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text( 'Positon ${e['position']}',style: const TextStyle(fontSize: 14),),
                              Text(e['contact_no'],style: const TextStyle(fontSize: 14),),
                            ],
                          ),
                        ),
                ),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(5.0),
                              textStyle: const TextStyle(fontSize: 20)
                            ),
                              onPressed: (){
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (context)=>
                                        EditPage(employee: Employee(
                                          uid: e.id,
                                          employeename: e['employee_name'],
                                          position: e['position'],
                                          contactno: e['contact_no']
                                        ),))
                                    , (route) => false);
                              },
                              child: const Text('Edit')),
                          TextButton(
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(5.0),
                                  textStyle: const TextStyle(fontSize: 20)
                              ),
                              onPressed: ()async {
                                var response = await FirebaseCrud.deleteEmployee(docId: e.id);
                                if (response.code != 200) {
                                  ScaffoldMessenger.of(context).showSnackBar(  SnackBar(
                                      content:   Text(response.message.toString())
                                  ));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(  SnackBar(
                                      content:   Text(response.message.toString())
                                  ));
                                }
                              },
                              child: const Text('Delete')),
                        ],
                      ),
                  ],
                ),
                );
                }
                ).toList(),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
