import 'package:flutter/material.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          gradient: LinearGradient(
              colors: [Colors.amber, Colors.cyan],
              begin: AlignmentDirectional.topStart,
              end: Alignment.bottomRight)),
      // height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: const Text(
              'Flutter tips',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 24),
            ),
            subtitle: const Text(
              'Build your career now with us',
              style: TextStyle(
                  color: Color.fromARGB(255, 81, 81, 81), fontSize: 24),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 30,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              DateTime.now().toString(),
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
