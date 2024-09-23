import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/Constants/constants.dart';
import 'package:notes_app/models/TaskModel.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());
  addTask(Taskmodel task) async {
    var tasksBox = Hive.box<Taskmodel>(ktasksbox);
    emit(AddTaskLoading());
    try {
      await tasksBox.add(task);
      emit(AddTaskSuccess());
    } catch (e) {
      emit(AddTaskFailure(errMessage: e.toString()));
    }
  }
}
