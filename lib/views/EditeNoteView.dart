import 'package:flutter/material.dart';

import 'widgets/EditNoteBody.dart';

class Editnoteview extends StatelessWidget {
  const Editnoteview({super.key});
  static final String id = 'EditNote';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Editnotebody(),
    );
  }
}
