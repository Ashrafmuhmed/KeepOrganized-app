import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/TasksCubit/tasks_cubit.dart';
import 'package:notes_app/models/NoteModel.dart';
import 'package:notes_app/models/TaskModel.dart';
import 'package:notes_app/views/widgets/TasksWids/CustomTaskItem.dart';
import '../../../../cubits/NotesCubit/notes_cubit_cubit.dart';

class Taskslistview extends StatefulWidget {
  const Taskslistview({
    super.key,
  });

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
            child: ListView.builder(
          itemBuilder: (context, index) => Customtaskitem(
            task: tasks[index],
          ),
          itemCount: tasks.length,
        ));
      },
    );
  }
}
