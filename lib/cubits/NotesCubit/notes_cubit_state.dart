part of 'notes_cubit_cubit.dart';

@immutable
sealed class NotesCubitState {}

final class NotesCubitInitial extends NotesCubitState {}

final class NotesLoading extends NotesCubitState {}

final class NotesLoaded extends NotesCubitState {
  List<Notemodel> notes = [];
}

final class NotesFailure extends NotesCubitState {
  final String errM;
  NotesFailure(this.errM);
}
