import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/CustomButton.dart';
import 'package:notes_app/views/widgets/CustomTextField.dart';
class AddNoteForm extends StatefulWidget {
  AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalid = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Add Note',
              style: TextStyle(fontSize: 20),
            ),
          ),
          CustomTextField(
            label: 'Note',
            onsaved: (value) {
              title = value;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomTextField(
              label: 'Description',
              maxLines: 5,
              onsaved: (value) {
                subTitle = value;
              },
            ),
          ),
          SizedBox(
            height: 41,
          ),
          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate())
                formKey.currentState!.save();
              else {
                autovalid = AutovalidateMode.always;
                setState(() {
                  
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
