import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/NotesCubit/notes_cubit_cubit.dart';
import 'package:notes_app/views/widgets/CustomSearchIcon.dart';
import 'dart:ui';
import 'widgets/AddNoteSheet.dart';
import 'widgets/CustomAppBar.dart';
import 'widgets/NotesListView.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});
  static const String id = 'homeview';

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  int _currentIndex = 0;
  List<Widget> bottomBar = const [Icon(Icons.add), Icon(Icons.person)];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(54, 0, 0, 0),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Notes'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
            currentIndex: _currentIndex,
            onTap: (int newIndex) {
              setState(() {
                _currentIndex = newIndex;
              });
            },
          ),
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
            child: Column(
              children: [
                // SizedBox(
                //   height: 45,
                // ),
                CustomAppBar(
                  icon: const CustomIcon(
                    icon: Icons.search,
                  ),
                  title: 'Notes App',
                  onPressed: () {},
                ),
                const NotesListView(),
              ],
            ),
          )),
    );
  }
}
