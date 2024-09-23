import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/AddTaskCubit/add_task_cubit.dart';
import 'package:notes_app/views/widgets/NotesWids/AddNoteSheet.dart';
import 'package:notes_app/views/widgets/TasksWids/AddTaskForm.dart';
import 'package:notes_app/views/widgets/GeneralWids/CustomAppBar.dart';
import 'package:notes_app/views/widgets/GeneralWids/CustomSearchIcon.dart';
import 'package:notes_app/views/widgets/NotesWids/NotesListView.dart';
import 'package:notes_app/views/widgets/TasksWids/AddTasksSheet.dart';
import 'package:notes_app/views/widgets/TasksWids/TasksListView.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});
  static final String id = 'Todo';

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              context: context,
              builder: (context) {
                return BlocProvider(
                  create: (context) => AddTaskCubit(),
                  child: Addtaskssheet(),
                );
              });
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            // SizedBox(
            //   height: 45,
            // ),
            CustomAppBar(
              icon: const CustomIcon(
                icon: Icons.search,
              ),
              title: 'KeepNotes',
              onPressed: () {},
            ),
            const Taskslistview(),
          ],
        ),
      ),
    );
  }
}
