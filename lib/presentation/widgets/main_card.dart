import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 150,
        height: 250,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  imgUrl,
                ),
                fit: BoxFit.cover),
            borderRadius: kRadius10),
      ),
    );
  }
}
