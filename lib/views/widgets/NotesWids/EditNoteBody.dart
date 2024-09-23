import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/NotesCubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/NoteModel.dart';
import 'package:notes_app/views/widgets/GeneralWids/CustomAppBar.dart';
import 'package:notes_app/views/widgets/GeneralWids/CustomSearchIcon.dart';
import 'package:notes_app/views/widgets/GeneralWids/CustomTextField.dart';

class Editnotebody extends StatefulWidget {
  const Editnotebody({super.key, required this.note});
  final Notemodel note;

  @override
  State<Editnotebody> createState() => _EditnotebodyState();
}

class _EditnotebodyState extends State<Editnotebody> {
  @override
  Widget build(BuildContext context) {
    String? title = widget.note.title, subTitle = widget.note.description;
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(
            icon: const CustomIcon(
              icon: Icons.check,
            ),
            title: 'Edit Note',
            onPressed: () async {
              if (widget.note.title == title &&
                  widget.note.description == subTitle) {
                Navigator.pop(context);
              } else {
                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Confirm"),
                      content: const Text(
                          "Are you sure you want to SAVE what you edited?"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                            widget.note.title = title ?? widget.note.title;
                            widget.note.description =
                                subTitle ?? widget.note.description;
                            widget.note.save();
                            BlocProvider.of<NotesCubitCubit>(context)
                                .fetchAllNotes();
                            Navigator.pop(context);
                          },
                          child: Text("Yes"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text("No"),
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
          const SizedBox(
            height: 44,
          ),
          CustomTextField(
            label: 'Title',
            onChanged: (String editedTitle) {
              title = editedTitle;
            },
            intialText: widget.note.title,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            label: 'Description',
            maxLines: 5,
            intialText: widget.note.description,
            onChanged: (String editedSubTitle) {
              subTitle = editedSubTitle;
            },
          ),
        ],
      ),
    );
  }
}
