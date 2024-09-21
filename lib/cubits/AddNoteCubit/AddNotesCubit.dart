import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/Constants/constants.dart';
import 'package:notes_app/cubits/AddNoteCubit/AddNoteState.dart';
import 'package:notes_app/models/NoteModel.dart';

class AddNoteCubit extends Cubit<AddNotesState> {
  AddNoteCubit() : super(NotesInitial());
  addNote(Notemodel note) async {
    var notesBox = Hive.box<Notemodel>(knotebox);
    emit(AddNoteLoading());
    try {
      await notesBox.add(note);
      emit(AddNoteSuccess());
    }catch (e) {
      emit(AddNoteFailure(errMessage: e.toString()));
    }
  }
}
