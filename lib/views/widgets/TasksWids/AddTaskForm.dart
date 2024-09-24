import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/AddNoteCubit/AddNoteState.dart';
import 'package:notes_app/cubits/AddTaskCubit/add_task_cubit.dart';
import 'package:notes_app/cubits/TasksCubit/tasks_cubit.dart';
import 'package:notes_app/models/TaskModel.dart';
import 'package:notes_app/views/widgets/GeneralWids/CustomButton.dart';
import 'package:notes_app/views/widgets/GeneralWids/CustomTextField.dart';

class Addtaskform extends StatefulWidget {
  Addtaskform({
    super.key,
  });

  @override
  State<Addtaskform> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<Addtaskform> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalid = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalid,
      key: formKey,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Add Task',
              style: TextStyle(fontSize: 20),
            ),
          ),
          CustomTextField(
            label: 'Title',
            onsaved: (value) {
              title = value;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomTextField(
              label: 'Subtitle',
              maxLines: 5,
              onsaved: (value) {
                subTitle = value;
              },
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          BlocBuilder<AddTaskCubit, AddTaskState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    Taskmodel task =
                        Taskmodel(subtitle: subTitle!, title: title!,state: false);
                    BlocProvider.of<AddTaskCubit>(context).addTask(task);
                    BlocProvider.of<TasksCubit>(context).fetchAllTasks();
                
                  } else {
                    autovalid = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
