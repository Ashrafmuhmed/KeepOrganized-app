import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/AddNoteCubit/AddNotesCubit.dart';
import 'package:notes_app/views/widgets/AddNoteForm.dart';
import '../../cubits/AddNoteCubit/AddNoteState.dart';
// import 'package:notes_app/views/widgets/CustomTextField.dart';

// import 'CustomButton.dart';

class AddNoteSheet extends StatelessWidget {
  const AddNoteSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.4,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: BlocConsumer<AddNoteCubit, AddNotesState>(
          listener: (context, state) {
            if (state is AddNoteFailure) {
              print('Failed');
            } else if (state is AddNoteSuccess) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: state is AddNoteLoading ? true : false,
                child: AddNoteForm());
          },
        ),
      ),
    );
  }
}
