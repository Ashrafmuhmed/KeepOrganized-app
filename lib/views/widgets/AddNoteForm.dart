import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/AddNoteCubit/AddNoteState.dart';
import 'package:notes_app/cubits/AddNoteCubit/AddNotesCubit.dart';
import 'package:notes_app/models/NoteModel.dart';
import 'package:notes_app/views/widgets/CustomButton.dart';
import 'package:notes_app/views/widgets/CustomTextField.dart';

class AddNoteForm extends StatefulWidget {
  AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalid = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalid,
      key: formKey,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Add Note',
              style: TextStyle(fontSize: 20),
            ),
          ),
          CustomTextField(
            label: 'Note',
            onsaved: (value) {
              title = value;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomTextField(
              label: 'Description',
              maxLines: 5,
              onsaved: (value) {
                subTitle = value;
              },
            ),
          ),
          const SizedBox(
            height: 41,
          ),
          BlocBuilder<AddNoteCubit, AddNotesState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    Notemodel note = Notemodel(
                        dateTime: TimeOfDay.now().toString(),
                        description: subTitle!,
                        title: title!,
                        color: Colors.amber.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(note);
                  } else {
                    autovalid = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
