import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/TasksCubit/tasks_cubit.dart';
import 'package:notes_app/models/TaskModel.dart';
import 'package:notes_app/views/widgets/GeneralWids/CustomAppBar.dart';
import 'package:notes_app/views/widgets/GeneralWids/CustomSearchIcon.dart';
import 'package:notes_app/views/widgets/GeneralWids/CustomTextField.dart';

class Edittaskbody extends StatefulWidget {
  const Edittaskbody({super.key, required this.task});
  final Taskmodel task;

  @override
  State<Edittaskbody> createState() => _EditnotebodyState();
}

class _EditnotebodyState extends State<Edittaskbody> {
  @override
  Widget build(BuildContext context) {
    String? title = widget.task.title, subTitle = widget.task.subtitle;
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(
            icon: const CustomIcon(
              icon: Icons.check,
            ),
            title: 'Edit Note',
            onPressed: () async {
              if (widget.task.title == title &&
                  widget.task.subtitle == subTitle) {
                Navigator.pop(context);
              } else {
                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Confirm"),
                      content: const Text(
                          "Are you sure you want to SAVE what you edited?"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                            widget.task.title = title ?? widget.task.title;
                            widget.task.subtitle =
                                subTitle ?? widget.task.subtitle;
                            widget.task.save();
                            BlocProvider.of<TasksCubit>(context)
                                .fetchAllTasks();
                            Navigator.pop(context);
                          },
                          child: Text("Yes"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text("No"),
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
          const SizedBox(
            height: 44,
          ),
          CustomTextField(
            label: 'Title',
            onChanged: (String editedTitle) {
              title = editedTitle;
            },
            intialText: widget.task.title,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            label: 'Description',
            maxLines: 5,
            intialText: widget.task.subtitle,
            onChanged: (String editedSubTitle) {
              subTitle = editedSubTitle;
            },
          ),
        ],
      ),
    );
  }
}
