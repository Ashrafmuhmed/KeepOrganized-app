import 'package:flutter/material.dart';

import 'CustomNoteItem.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemBuilder: (context, index) => CustomNoteItem(),
      itemCount: 42,
    ));
  }
}
