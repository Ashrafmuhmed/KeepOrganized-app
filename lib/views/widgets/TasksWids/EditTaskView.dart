import 'package:flutter/material.dart';
import 'package:notes_app/models/TaskModel.dart';
import 'package:notes_app/views/widgets/TasksWids/EditTasKBody.dart';

class Edittaskview extends StatelessWidget {
  const Edittaskview({super.key, required this.task});
  final Taskmodel task;
  static final String id = 'TaskEdit';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Edittaskbody(task: task),
    );
  }
}
