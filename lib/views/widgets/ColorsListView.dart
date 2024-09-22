import 'package:flutter/material.dart';
import 'package:notes_app/models/GradientColor.dart';

class ColorItem extends StatelessWidget {
  const ColorItem(
      {super.key, required this.isActive, required this.gradientcolor});
  final Gradientcolor gradientcolor;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 40,
      width: isActive ? 55 : 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: [
          Color(gradientcolor.color1!),
          Color(gradientcolor.color2!)
        ], begin: Alignment.topCenter, end: AlignmentDirectional.bottomCenter),
      ),
    );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({
    super.key,
  });

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  List<Gradientcolor> gradientColor = [
    Gradientcolor(color1: Colors.amber.value, color2: Colors.blue.value),
    Gradientcolor(
        color1: Color(0xff4C4177).value, color2: Color(0xff2A5470).value),
    Gradientcolor(
        color1: Color(0x800080).value, color2: Color(0xffffc0cb).value),
    Gradientcolor(
        color1: Color(0xfffc4a1a).value, color2: Color(0xfff7b733).value),
    Gradientcolor(
        color1: Color(0xffe1eec3).value, color2: Color(0xfff05053).value),
    Gradientcolor(
        color1: Color(0xff06beb6).value, color2: Color(0xff48b1bf).value),
    Gradientcolor(
        color1: Color(0xff093637).value, color2: Color(0xff44a08d).value),
    Gradientcolor(
        color1: Color(0xfff4c4f3).value, color2: Color(0xfffc67fa).value),
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2 * 38,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: gradientColor.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                currentIndex = index;
                setState(() {});
              },
              child: ColorItem(
                isActive: currentIndex == index,
                gradientcolor: gradientColor[index],
              ),
            );
          }),
    );
  }
}
