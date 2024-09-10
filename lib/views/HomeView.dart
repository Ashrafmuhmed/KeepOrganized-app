import 'package:flutter/material.dart';

import 'widgets/AddNoteSheet.dart';
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
            onPressed: () {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  context: context,
                  builder: (context) {
                    return const AddNoteSheet();
                  });
            },
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
          ),
          body: Column(
            children: [
              // SizedBox(
              //   height: 45,
              // ),
              CustomAppBar(),
              NotesListView(),
            ],
          )),
    );
  }
}
