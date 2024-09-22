import 'package:flutter/material.dart';
import 'package:notes_app/models/NoteModel.dart';
import 'package:notes_app/views/EditeNoteView.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.note});
  final Notemodel note;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<Notemodel>(note),
      onDismissed: (direction) => note.delete,
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Icon(
          Icons.delete,
          color: Colors.black,
        ),
      ),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, Editnoteview.id),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                  colors: [Color(note.color1), Color(note.color2)],
                  begin: AlignmentDirectional.topStart,
                  end: Alignment.bottomRight)),
          // height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
                subtitle: Text(
                  note.description,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 81, 81, 81), fontSize: 24),
                ),
                trailing: IconButton(
                    onPressed: () async {
                      await note.delete();
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                      size: 30,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  note.dateTime,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
