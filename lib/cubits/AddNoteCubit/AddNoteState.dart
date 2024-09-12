abstract class AddNotesState {}

class NotesInitial extends AddNotesState {}

class AddNoteLoading extends AddNotesState {}

class AddNoteSuccess extends AddNotesState {}

class AddNoteFailure extends AddNotesState {
  final String errMessage;
  AddNoteFailure({required this.errMessage});
}
