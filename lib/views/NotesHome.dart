import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/AddNoteCubit/AddNotesCubit.dart';
import 'package:notes_app/views/widgets/GeneralWids/CustomAppBar.dart';
import 'package:notes_app/views/widgets/GeneralWids/CustomSearchIcon.dart';
import 'package:notes_app/views/widgets/NotesWids/AddNoteSheet.dart';

import 'widgets/NotesWids/NotesListView.dart';

class NotesHome extends StatelessWidget {
  const NotesHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
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
                  return BlocProvider(
                    create: (context) => AddNoteCubit(),
                    child: const AddNoteSheet(),
                  );
                });
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              CustomAppBar(
                icon: const CustomIcon(
                  icon: Icons.notes,
                ),
                title: 'KeepNotes',
                onPressed: () {},
              ),
              const NotesListView(),
            ],
          ),
        ),
      ),
    );
  }
}
