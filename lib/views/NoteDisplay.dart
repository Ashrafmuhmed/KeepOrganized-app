import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/NotesCubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/NoteModel.dart';
import 'package:notes_app/views/EditeNoteView.dart';

class Notedisplay extends StatelessWidget {
  const Notedisplay({super.key, required this.note});
  final Notemodel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Editnoteview(note: note)));
              },
              icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () async {
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
                              note.delete();
                              BlocProvider.of<NotesCubitCubit>(context)
                                  .fetchAllNotes();
                              Navigator.pop(context);
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
                    });
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ListView(
          children: [
            Text(
              note.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                height: 1,
              ),
            ),
            Text(
              note.description,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: const Color.fromARGB(255, 146, 145, 145)),
            ),
          ],
        ),
      ),
    );
  }
}
