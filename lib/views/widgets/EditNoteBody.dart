import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/CustomAppBar.dart';
import 'package:notes_app/views/widgets/CustomSearchIcon.dart';
import 'package:notes_app/views/widgets/CustomTextField.dart';

class Editnotebody extends StatelessWidget {
  const Editnotebody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          CustomAppBar(
              icon: CustomIcon(
                icon: Icons.check,
              ),
              title: 'Edit Note'),
          SizedBox(
            height: 44,
          ),
          CustomTextField(label: 'Title',onsaved: (p0) {
            
          },),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            label: 'Description',
            maxLines: 5,
            onsaved: (p0) {
              
            },
          ),
        ],
      ),
    );
  }
}
