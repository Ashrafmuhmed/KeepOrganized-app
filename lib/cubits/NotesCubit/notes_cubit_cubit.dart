import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/NoteModel.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesCubitInitial());
}
