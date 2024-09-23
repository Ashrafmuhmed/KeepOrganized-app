import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/AddNoteCubit/AddNotesCubit.dart';
import 'package:notes_app/views/widgets/NotesWids/AddNoteForm.dart';
import '../../../cubits/AddNoteCubit/AddNoteState.dart';

class AddNoteSheet extends StatelessWidget {
  const AddNoteSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Container(
        height: MediaQuery.of(context).size.height / 1.2,
        width: MediaQuery.of(context).size.width,
        child: BlocConsumer<AddNoteCubit, AddNotesState>(
            listener: (context, state) {
          if (state is AddNoteFailure) {
            print('Failed');
          } else if (state is AddNoteSuccess) {
            Navigator.pop(context);
          }
        }, builder: (context, state) {
          return AbsorbPointer(
              absorbing: state is AddNoteLoading ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SingleChildScrollView(child: AddNoteForm()),
              ));
        }),
      ),
    );
  }
}
