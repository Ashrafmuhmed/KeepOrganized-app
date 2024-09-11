import 'package:flutter/material.dart';
import 'package:notes_app/views/EditeNoteView.dart';
import 'package:notes_app/views/HomeView.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Homeview.id: (context) => Homeview(),
        Editnoteview.id: (context) => Editnoteview()
      },
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      initialRoute: Homeview.id,
    );
  }
}
