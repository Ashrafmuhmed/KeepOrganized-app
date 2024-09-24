import 'package:flutter/material.dart';
import 'package:notes_app/views/todo.dart';
import 'package:notes_app/views/NotesHome.dart';


class Homeview extends StatefulWidget {
  const Homeview({super.key});
  static const String id = 'homeview';

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> bottomBar = const [ Todo(),NotesHome(),];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Tasks',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.note),
                label: 'Notes',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          resizeToAvoidBottomInset: true,
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     showModalBottomSheet(
          //         shape: const RoundedRectangleBorder(
          //             borderRadius: BorderRadius.only(
          //                 topLeft: Radius.circular(15),
          //                 topRight: Radius.circular(15))),
          //         context: context,
          //         builder: (context) {
          //           return const AddNoteSheet();
          //         });
          //   },
          //   shape: const CircleBorder(),
          //   child: const Icon(Icons.add),
          // ),
          body: bottomBar[_selectedIndex]),
    );
  }
}
