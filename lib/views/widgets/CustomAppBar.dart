import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.icon, required this.title});
  final String title;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      color: const Color.fromARGB(0, 255, 255, 255),
      height: 80,
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 28),
          ),
          const Spacer(),
          icon,
        ],
      ),
    );
  }
}
