import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/Constants/constants.dart';
import 'package:notes_app/SimpleBlocObserver.dart';
import 'package:notes_app/cubits/NotesCubit/notes_cubit_cubit.dart';
import 'package:notes_app/cubits/TasksCubit/tasks_cubit.dart';
import 'package:notes_app/models/NoteModel.dart';
import 'package:notes_app/models/TaskModel.dart';
import 'package:notes_app/views/todo.dart';
import 'package:notes_app/views/HomeView.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Bloc.observer = Simpleblocobserver();
  Hive.registerAdapter(NotemodelAdapter());
  Hive.registerAdapter(TaskmodelAdapter());
  try {
    await Hive.openBox<Taskmodel>(ktasksbox);
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NotesCubitCubit(),
        ),
        BlocProvider(
          create: (context) => TasksCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Homeview.id: (context) => const Homeview(),
          Todo.id: (context) => const Todo(),
        },
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        initialRoute: Homeview.id,
      ),
    );
  }
}
