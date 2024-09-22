import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.label,
      this.maxLines = 1,
      this.onsaved,
      this.intialText,
      this.onChanged});
  final String label;
  final int maxLines;
  final Function(String)? onChanged;
  final String? intialText;
  final void Function(String?)? onsaved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: TextFormField(
        initialValue: intialText,
        onSaved: onsaved,
        onChanged: onChanged,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Field is required';
          } else {
            return null;
          }
        },
        maxLines: maxLines,
        cursorColor: Colors.pinkAccent,
        decoration: InputDecoration(
            label: Text(label),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(color: Colors.green)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(color: Colors.deepPurpleAccent))),
      ),
    );
  }
}
