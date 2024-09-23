import 'package:flutter/material.dart';
import 'package:notes_app/models/NoteModel.dart';

import 'EditNoteBody.dart';

class Editnoteview extends StatelessWidget {
  const Editnoteview({super.key, required this.note});
  final Notemodel note;
  static final String id = 'EditNote';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Editnotebody(note:  note),
    );
  }
}
