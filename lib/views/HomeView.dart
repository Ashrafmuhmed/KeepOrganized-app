import 'package:flutter/material.dart';

import 'widgets/CustomAppBar.dart';
import 'widgets/CustomNoteItem.dart';
import 'widgets/NotesListView.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});
  static final String id = 'homeview';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
            shape: CircleBorder(),
          ),
          body: Column(
            children: [
              // SizedBox(
              //   height: 45,
              // ),
              CustomAppBar(),
              NotesListView()
            ],
          )),
    );
  }
}
