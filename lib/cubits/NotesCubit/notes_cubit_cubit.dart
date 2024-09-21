import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/Constants/constants.dart';
import 'package:notes_app/models/NoteModel.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesCubitInitial());
  List<Notemodel>? notes;
  fetchAllNotes() {
    var notesBox = Hive.box<Notemodel>(knotebox);
    notes = notesBox.values.toList();
  }
}
