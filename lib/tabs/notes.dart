import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_string/random_string.dart';
import 'package:wallpaper/constants.dart';

class Notes extends StatefulWidget {
  Notes({this.uid});
  final String uid;
  @override
  _NotesState createState() => _NotesState(uid: uid);
}

class _NotesState extends State<Notes> {
  _NotesState({this.uid});

  final String uid;
  String todoTitle = "";
  String desc = "";
  createTodos() async {
    var Id = randomString(20);
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection(uid).doc("$Id");

    Map<String, String> todos = {"todoTitle": todoTitle, "desc": desc};

    documentReference.set(todos).whenComplete(() => print("Input Created"));
  }

  modifyTodos(String id) async {
    print(id);
    String T;
    String D;
    FirebaseFirestore.instance.collection(uid).doc(id).get().then((value) {
      setState(() {
        T = value.data()["todoTitle"];
        D = value.data()["desc"];
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: TextField(
                decoration: InputDecoration(hintText: '$T'),
                onChanged: (String value) {
                  setState(() {
                    T=value;
                  });
                },
              ),
              content: TextField(
                maxLines: null,
                expands: true,
                decoration: InputDecoration(hintText: '$D'),
                onChanged: (String value) {
                  setState(() {
                    D=value;
                  });
                },
              ),
              actions: [
                FlatButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection(uid)
                        .doc(id)
                        .update({'todoTitle': T, 'desc': D});
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Modify",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          backgroundColor: Colors.white12,
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            iconTheme: new IconThemeData(color: Colors.black),
            backgroundColor: appBarColor,
            title: Text("NOTES",
                style: GoogleFonts.pacifico(
                    textStyle: TextStyle(
                        fontSize: 24.0,
                        color: appBarTextColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2))),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepPurple,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      title: TextField(
                        decoration: InputDecoration(hintText: 'Note Title'),
                        onChanged: (String value) {
                          todoTitle = value;
                        },
                      ),
                      content: TextField(
                        maxLines: null,
                        expands: true,
                        decoration: InputDecoration(hintText: 'Note content'),
                        onChanged: (String value) {
                          desc = value;
                        },
                      ),
                      actions: [
                        FlatButton(
                          onPressed: () {
                            createTodos();
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    );
                  });
            },
            child: Icon(Icons.add, color: Colors.white),
          ),
          body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection(uid).snapshots(),
            builder: (context, snapshots) {
              if (snapshots.data == null)
                return Center(
                    child: Text(
                  "No notes",
                  style: TextStyle(color: Colors.grey),
                ));
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshots.data.documents.length,
                  itemBuilder: (context, index) {

                    DocumentSnapshot documentSnapshot =
                        snapshots.data.documents[index];
                    return Dismissible(
                      onDismissed: (direction) {
                        FirebaseFirestore.instance
                            .collection(uid)
                            .doc(documentSnapshot.id);
                      },
                      key: Key(documentSnapshot.id),
                      child: Card(
                        color: (index%2==0) ? Colors.yellow[100] : Colors.pink[100],
                        shadowColor:  (index%2==0) ? Colors.yellow[400] : Colors.pink[400],
                        margin: EdgeInsets.all(8),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: ListTile(
                          onTap: () {
                            modifyTodos(documentSnapshot.id);
                          },
                          title: Text(
                            documentSnapshot["todoTitle"],
                            style: TextStyle(fontSize: 22.0),
                          ),

                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection(uid)
                                  .doc(documentSnapshot.id);
                              SnackBar(
                                content: Text(' Note Deleted'),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  });
            },
          ),
        ));
  }
}
