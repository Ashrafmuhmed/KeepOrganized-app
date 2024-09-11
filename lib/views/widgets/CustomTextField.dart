import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.label, this.maxLines = 1});
  final String label;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: TextField(
        maxLines: maxLines,
        cursorColor: Colors.pinkAccent,
        decoration: InputDecoration(
            label: Text(label),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(color: Colors.green)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(color: Colors.deepPurpleAccent))),
      ),
    );
  }
}
