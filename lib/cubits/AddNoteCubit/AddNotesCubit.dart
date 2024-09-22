import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/Constants/constants.dart';
import 'package:notes_app/cubits/AddNoteCubit/AddNoteState.dart';
import 'package:notes_app/models/GradientColor.dart';
import 'package:notes_app/models/NoteModel.dart';

class AddNoteCubit extends Cubit<AddNotesState> {
  AddNoteCubit() : super(NotesInitial());
  Gradientcolor gradientcolor =
      Gradientcolor(color1: Colors.blue.value, color2: Colors.amber.value);
  addNote(Notemodel note) async {
    note.color1 = gradientcolor.color1!;
    note.color2 = gradientcolor.color2!;
    var notesBox = Hive.box<Notemodel>(knotebox);
    emit(AddNoteLoading());
    try {
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(errMessage: e.toString()));
    }
  }
}
