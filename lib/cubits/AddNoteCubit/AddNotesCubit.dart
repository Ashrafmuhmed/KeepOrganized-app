import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/Constants/constants.dart';
import 'package:notes_app/cubits/AddNoteCubit/AddNoteState.dart';
import 'package:notes_app/models/NoteModel.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  addNote(Notemodel note) async {
    emit(AddNoteLoading());
    try {
      await Hive.box(knotebox).add(note);
      emit(AddNoteSuccess());
    } on Exception catch (e) {
      emit(AddNoteFailure(errMessage: e.toString()));
    }
  }
}
