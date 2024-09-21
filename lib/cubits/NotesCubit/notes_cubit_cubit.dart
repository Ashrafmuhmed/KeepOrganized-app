import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/Constants/constants.dart';
import 'package:notes_app/models/NoteModel.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesCubitInitial());
  fetchAllNotes() {
    try {
      var notesBox = Hive.box<Notemodel>(knotebox);
      emit(NotesLoaded(notes: notesBox.values.toList()));
    } catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }
}
