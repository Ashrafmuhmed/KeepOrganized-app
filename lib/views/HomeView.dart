import 'package:flutter/material.dart';

import 'widgets/CustomAppBar.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});
  static final String id = 'homeview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAppBar(),
    );
  }
}
