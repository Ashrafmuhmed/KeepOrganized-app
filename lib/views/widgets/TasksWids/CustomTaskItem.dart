import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/TasksCubit/tasks_cubit.dart';
import 'package:notes_app/models/TaskModel.dart';
import 'package:notes_app/views/widgets/TasksWids/TaskDisplay.dart';

class Customtaskitem extends StatefulWidget {
  const Customtaskitem({super.key, required this.task});
  final Taskmodel task;

  @override
  State<Customtaskitem> createState() => _CustomtaskitemState();
}

class _CustomtaskitemState extends State<Customtaskitem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
        child: Center(
          child: Icon(Icons.delete),
        ),
      ),
      onDismissed: (direction) async {
        await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Confirm"),
                content:
                    const Text("Are you sure you want to delete this task?"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      widget.task.delete();
                      BlocProvider.of<TasksCubit>(context).fetchAllTasks();
                      Navigator.pop(context);
                    },
                    child: Text("Yes"),
                  ),
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<TasksCubit>(context).fetchAllTasks();
                      Navigator.of(context).pop(false);
                    },
                    child: Text("No"),
                  ),
                ],
              );
            });
      }

      //  {
      //   widget.task.delete();
      //   BlocProvider.of<TasksCubit>(context).fetchAllTasks();
      // }

      ,
      child: GestureDetector(
        onLongPress: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Taskdisplay(task: widget.task);
          }));
        },
        child: CheckboxListTile(
            value: widget.task.state,
            onChanged: (bool? newState) {
              setState(() {
                widget.task.state = newState!;
                widget.task.save();
                BlocProvider.of<TasksCubit>(context).fetchAllTasks();
              });
            },
            subtitle: Text(
              widget.task.subtitle!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color.fromARGB(255, 155, 155, 155),
                fontWeight: FontWeight.w200,
                fontSize: 12,
              ),
            ),
            title: Text(
              widget.task.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            )),
      ),
    );
  }
}
