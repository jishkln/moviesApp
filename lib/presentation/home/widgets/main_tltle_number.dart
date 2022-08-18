import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/number_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class MainTItleNumberCard extends StatelessWidget {
  const MainTItleNumberCard({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Maintitle(title: 'Top 10 Tv Shows in India Today'),
        kHight,
        LimitedBox(
          maxHeight: 220,
          child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) => NumberCardWidget(
                  imgUrl: imgUrl,
                  index: index,
                ),
              )),
        ),
      ],
    );
  }
}
