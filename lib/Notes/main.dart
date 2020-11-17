import 'package:flutter/material.dart';
import 'package:wallpaper/Notes/screens/note_screen.dart';
import 'package:wallpaper/Notes/screens/notes_screen.dart';


class NotesApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: NotesScreen.routeName,

      onGenerateRoute: (RouteSettings settings) {
        var routes = <String, WidgetBuilder>{
          NotesScreen.routeName: (context) => NotesScreen(),
          NoteScreen.routeName: (context) => NoteScreen(settings.arguments)
        };
        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      },
    );
  }
}
