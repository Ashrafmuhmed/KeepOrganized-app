import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          color: const Color.fromARGB(16, 255, 255, 255),
          borderRadius: BorderRadius.circular(11)),
      child: Icon(
        Icons.search,
        weight: 5,
      ),
    );
  }
}
