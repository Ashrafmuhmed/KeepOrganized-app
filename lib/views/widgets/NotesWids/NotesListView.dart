import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/NoteModel.dart';
import '../../../cubits/NotesCubit/notes_cubit_cubit.dart';
import 'CustomNoteItem.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({
    super.key,
  });

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  void initState() {
    BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubitCubit, NotesCubitState>(
      builder: (context, state) {
        List<Notemodel> notes =
            BlocProvider.of<NotesCubitCubit>(context).notes ?? [];
        return Expanded(
            child: notes.length == 0
                ? Image.asset(
                    'assets/Pics/Asset 2.png',
                    height: 250,
                    width: 250,
                  )
                : ListView.builder(
                    itemBuilder: (context, index) => CustomNoteItem(
                      note: notes.elementAt(index),
                    ),
                    itemCount: notes.length,
                  ));
      },
    );
  }
}
