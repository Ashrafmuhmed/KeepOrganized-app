import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/AddNoteCubit/AddNotesCubit.dart';
import 'package:notes_app/cubits/AddTaskCubit/add_task_cubit.dart';
import 'package:notes_app/views/widgets/NotesWids/AddNoteForm.dart';
import 'package:notes_app/views/widgets/TasksWids/AddTaskForm.dart';
import '../../../cubits/AddNoteCubit/AddNoteState.dart';

class Addtaskssheet extends StatelessWidget {
  const Addtaskssheet({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: Container(
        height: MediaQuery.of(context).size.height / 1.2,
        width: MediaQuery.of(context).size.width,
        child: BlocConsumer<AddTaskCubit, AddTaskState>(
            listener: (context, state) {
          if (state is AddTaskFailure) {
            print('Failed');
          } else if (state is AddTaskSuccess) {
            Navigator.pop(context);
          }
        }, builder: (context, state) {
          return AbsorbPointer(
              absorbing: state is AddTaskLoading ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SingleChildScrollView(child: Addtaskform()),
              ));
        }),
      ),
    );
  }
}
