import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {

  String todoTitle = "";

  createTodos() {
    DocumentReference documentReference = Firestore.instance.collection("MyNotes").document(todoTitle);
    Map<String, String> todos = {"todoTitle": todoTitle};

    documentReference.setData(todos).whenComplete(() => print("Input Created"));
  }

  deleteTodos(item) {

    DocumentReference documentReference = Firestore.instance.collection("MyNotes").document(item);

    documentReference.delete().whenComplete(() => print("Deleted"));
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    title: Text("Add New Note",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    content: TextField(
                      onChanged: (String value) {
                        todoTitle = value;
                      },

                    ),
                    actions: [
                      FlatButton(
                        onPressed: () {
                         createTodos();
                        Navigator.of(context).pop();
                          },
                        child: Text("Add" ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      ),
                      FlatButton(onPressed:(){ Navigator.of(context).pop();}, child:  Text("Cancel",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),)
                    ],
                  );
                });
          },
          child: Icon(Icons.add, color: Colors.white),
        ),
        body:
        StreamBuilder(
          stream: Firestore.instance.collection("MyNotes").snapshots(),
          builder: (context,snapshots){
            if(snapshots.data == null) return Center(child: Text("No notes", style: TextStyle(color: Colors.grey),));
            return  ListView.builder(
              shrinkWrap:true,
            itemCount: snapshots.data.documents.length,
          itemBuilder: (context, index) {
              DocumentSnapshot documentSnapshot = snapshots.data.documents[index];
          return Dismissible(
            onDismissed: (direction){
              deleteTodos(documentSnapshot["todoTitle"]);
            },
          key: Key(documentSnapshot["todoTitle"]),
          child: Card(
          margin: EdgeInsets.all(8),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: ListTile(
          title: Text(documentSnapshot["todoTitle"]),
          trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red,),
          onPressed: (){
         deleteTodos(documentSnapshot["todoTitle"]);
          },
          ),
          ),
          ));
          });
          },),
        )




      );

  }
}