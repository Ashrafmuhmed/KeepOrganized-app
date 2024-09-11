import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/CustomAppBar.dart';
import 'package:notes_app/views/widgets/CustomSearchIcon.dart';

class Editnotebody extends StatelessWidget {
  const Editnotebody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          CustomAppBar(
              icon: CustomIcon(
                icon: Icons.check,
              ),
              title: 'Edit Note')
        ],
      ),
    );
  }
}
