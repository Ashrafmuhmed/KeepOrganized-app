import 'package:flutter/material.dart';
import 'package:notes_app/views/HomeView.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Homeview.id : (context) => Homeview(),
      },
      theme: ThemeData(brightness: Brightness.dark,fontFamily: 'Poppins'),
      
      initialRoute: Homeview.id,
    );
  }
}