import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/CustomSearchIcon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
      child: Container(
        padding: const EdgeInsets.only(top: 24, left: 26),
        color: const Color.fromARGB(0, 255, 255, 255),
        height: 130,
        child:  Row(
          children: [
            Text(
              'Notes App',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 28),
            ),
            // SizedBox(
            // width: 25,
            // ),
            Spacer(),
            CustomSearchIcon(),
            SizedBox(
              width: 15,
            )
          ],
        ),
      ),
    );
  }
}
