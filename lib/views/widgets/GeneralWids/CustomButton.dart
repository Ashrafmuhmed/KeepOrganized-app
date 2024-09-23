import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, this.isLoading = false});
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 15,
        child: Center(
            child: isLoading
                ? const CircularProgressIndicator(
                    color: Colors.black,
                  )
                : const Text(
                    'Add',
                    style: TextStyle(color: Colors.black),
                  )),
      ),
    );
  }
}
