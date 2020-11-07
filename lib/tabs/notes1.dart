// Import MaterialApp and other widgets which we can use to quickly create a material app
import 'package:flutter/material.dart';
import 'package:wallpaper/Login/sign_up_view.dart';


class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  List<String> _todoItems = [];

  void _addTodoItem(String task) {

    if(task.length > 0) {

      setState(() => _todoItems.add(task));
    }
  }

  void _removeTodoItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  void _promptRemoveTodoItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              title: new Text('Mark "${_todoItems[index]}" as done?'),
              actions: <Widget>[
                new FlatButton(
                    child: new Text('CANCEL'),
                    onPressed: () => Navigator.of(context).pop()
                ),
                new FlatButton(
                    child: new Text('MARK AS DONE'),
                    onPressed: () {
                      _removeTodoItem(index);
                      Navigator.of(context).pop();
                    }
                )
              ]
          );
        }
    );
  }


  Widget _buildTodoList()  {
    return new ListView.builder(
      itemBuilder: (context, index) {
        if(index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index], index);
        }
      },
    );
  }


  Widget _buildTodoItem(String todoText, int index) {
    return new ListTile(
        title: new Text(todoText),
        onTap: () => _promptRemoveTodoItem(index)
    );
  }
String title="";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('Todo List')
      ),
      body: _buildTodoList(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _pushAddTodoScreen,
          tooltip: 'Add task',
          child: new Icon(Icons.add)
      ),
    );
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (context) {
              return new Scaffold(
                  appBar: new AppBar(
                      title: new Text('Add a new task')
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                     children: [
                      new TextField(
                      autofocus: true,
                      onSubmitted: (val) {
                        title=val;

                      },
                      decoration: new InputDecoration(
                          hintText: 'Enter something to do...',
                          contentPadding: const EdgeInsets.all(16.0)
                      ),),

                       RaisedButton(
                         shape:
                         RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                         color: Colors.black,
                         textColor: primary,
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text(
                             "ADD",
                             style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                           ),
                         ),
                         onPressed:  (){_addTodoItem(title);
                           Navigator.pop(context);}
                       ),
                     ],


                  ) )

              );
            }
        )
    );
  }
}