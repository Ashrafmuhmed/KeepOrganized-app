import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/TasksCubit/tasks_cubit.dart';
import 'package:notes_app/models/TaskModel.dart';
import 'package:notes_app/views/widgets/TasksWids/CustomTaskItem.dart';

class Taskslistview extends StatefulWidget {
  const Taskslistview({super.key, required this.id});
  final String id;
  @override
  State<Taskslistview> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<Taskslistview> {
  @override
  void initState() {
    BlocProvider.of<TasksCubit>(context).fetchAllTasks();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        List<Taskmodel> tasks =
            BlocProvider.of<TasksCubit>(context).tasks ?? [];
        return Expanded(
            child: tasks.length == 0
                ? Image.asset(
                    'assets/Pics/list_3208723.png',
                    height: 250,
                    width: 250,
                  )
                : ListView.builder(
                    itemBuilder: (context, index) => Customtaskitem(
                      task: tasks.elementAt(index),
                    ),
                    itemCount: tasks.length,
                  ));
      },
    );
  }
}
