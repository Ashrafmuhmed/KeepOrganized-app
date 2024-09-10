import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/CustomTextField.dart';

import 'CustomButton.dart';

class AddNoteSheet extends StatelessWidget {
  const AddNoteSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.4,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Add Note',
                style: TextStyle(fontSize: 20),
              ),
            ),
            CustomTextField(label: 'Note'),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CustomTextField(
                label: 'Description',
                maxLines: 5,
              ),
            ),
            SizedBox(
              height: 41,
            ),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}
