import 'package:flutter/material.dart';

import 'widgets/CustomAppBar.dart';
import 'widgets/CustomNoteItem.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});
  static final String id = 'homeview';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          // SizedBox(
          //   height: 45,
          // ),
          CustomAppBar(),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) => CustomNoteItem(),
            itemCount: 42,
          ))
        ],
      )),
    );
  }
}
