import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/CustomSearchIcon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      color: const Color.fromARGB(0, 255, 255, 255),
      height: 80,
      child: const Row(
        children: [
          Text(
            'Notes App',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 28),
          ),
          Spacer(),
          CustomSearchIcon(),
        ],
      ),
    );
  }
}
