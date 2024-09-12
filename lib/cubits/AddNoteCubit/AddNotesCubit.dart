import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/cubits/AddNoteCubit/AddNoteState.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
}
