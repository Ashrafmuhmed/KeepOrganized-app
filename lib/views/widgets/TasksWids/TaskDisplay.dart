import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/TasksCubit/tasks_cubit.dart';
import 'package:notes_app/models/TaskModel.dart';
import 'package:notes_app/views/widgets/TasksWids/EditTaskView.dart';

class Taskdisplay extends StatefulWidget {
  const Taskdisplay({super.key, required this.task});
  final Taskmodel task;

  @override
  State<Taskdisplay> createState() => _TaskdisplayState();
}

class _TaskdisplayState extends State<Taskdisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Edittaskview(task: widget.task)));
              },
              icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () async {
                await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Confirm"),
                        content: const Text(
                            "Are you sure you want to delete this task?"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              widget.task.delete();
                              BlocProvider.of<TasksCubit>(context)
                                  .fetchAllTasks();
                              Navigator.pop(context);
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
                    });
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ListView(
          children: [
            CheckboxListTile(
              value: widget.task.state,
              onChanged: (bool? newState) {
                setState(() {
                  widget.task.state = newState!;
                  BlocProvider.of<TasksCubit>(context).fetchAllTasks();
                });
              },
              title: Text(
                widget.task.title!,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                height: 1,
              ),
            ),
            Text(
              widget.task.subtitle!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 146, 145, 145)),
            ),
          ],
        ),
      ),
    );
  }
}
