import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/Constants/constants.dart';
import 'package:notes_app/models/NoteModel.dart';
import 'package:notes_app/models/TaskModel.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());
  List<Taskmodel>? tasks;
  fetchAllTasks() {
    var tasksBox = Hive.box<Taskmodel>(ktasksbox);
    tasks = tasksBox.values.toList();
    emit(TasksLoaded());
  }
}
