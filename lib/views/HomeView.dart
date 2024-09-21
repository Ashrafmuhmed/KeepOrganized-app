import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/NotesCubit/notes_cubit_cubit.dart';
import 'package:notes_app/views/widgets/CustomSearchIcon.dart';

import 'widgets/AddNoteSheet.dart';
import 'widgets/CustomAppBar.dart';
import 'widgets/NotesListView.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});
  static final String id = 'homeview';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubitCubit(),
      child: SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
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
            body: Container(
              height: MediaQuery.of(context).size.height,
              child: const Column(
                children: [
                  // SizedBox(
                  //   height: 45,
                  // ),
                  CustomAppBar(
                      icon: CustomIcon(
                        icon: Icons.search,
                      ),
                      title: 'Notes App'),
                  NotesListView(),
                ],
              ),
            )),
      ),
    );
  }
}
