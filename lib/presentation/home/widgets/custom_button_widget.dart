import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colores.dart';

// ignore: must_be_immutable
class ButtonMainScreen extends StatelessWidget {
  ButtonMainScreen({
    Key? key,
    required this.title,
    required this.icon,
    this.size,
  }) : super(key: key);
  final String title;
  final IconData icon;
  double? size = 22;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          //textDirection: TextDirection.rtl,
          color: kWhiteColor,
          size: 30,
        ),
        Text(
          title,
          style: TextStyle(fontSize: size),
        )
      ],
    );
  }
}
