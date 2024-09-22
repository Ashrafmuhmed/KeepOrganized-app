import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/Constants/constants.dart';
import 'package:notes_app/SimpleBlocObserver.dart';
import 'package:notes_app/models/NoteModel.dart';
import 'package:notes_app/views/EditeNoteView.dart';
import 'package:notes_app/views/HomeView.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Bloc.observer = Simpleblocobserver();
  Hive.registerAdapter(NotemodelAdapter());
  try {
    await Hive.openBox<Notemodel>(knotebox);
  } on Exception catch (e) {
    print('Error : $e');
  }
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
