import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.icon
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          color: const Color.fromARGB(16, 255, 255, 255),
          borderRadius: BorderRadius.circular(11)),
      child: Icon(
        icon,
        weight: 5,
      ),
    );
  }
}
