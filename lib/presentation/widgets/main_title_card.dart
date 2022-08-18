import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Maintitle(title: title),
        kHight,
        LimitedBox(
          maxHeight: 220,
          child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) => const MainCard(imgUrl: imgUrl),
              )),
        ),
      ],
    );
  }
}
