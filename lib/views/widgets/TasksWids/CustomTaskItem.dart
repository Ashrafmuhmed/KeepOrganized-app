import 'package:flutter/material.dart';
import 'package:notes_app/models/TaskModel.dart';

class Customtaskitem extends StatefulWidget {
  const Customtaskitem({super.key, required this.task});
  final Taskmodel task;

  @override
  State<Customtaskitem> createState() => _CustomtaskitemState();
}

class _CustomtaskitemState extends State<Customtaskitem> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        value: state,
        onChanged: (bool? newState) {
          setState(() {
            state = newState!;
          });
        },
        title: Text(
          widget.task.title!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ));
  }
}
