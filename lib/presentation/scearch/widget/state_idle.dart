import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colores.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/scearch/widget/title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w250_and_h141_face/eNI7PtK6DEYgZmHWP9gQNuff8pv.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(
          title: 'Top Searches',
        ),
        kHight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) => const TopSearchItemTile(),
              separatorBuilder: (ctx, index) => kHight20,
              itemCount: 10),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * .3,
          height: 70,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.contain),
          ),
        ),
        const Expanded(
          child: Text(
            'Movie Name',
            style: TextStyle(
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kWhiteColor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kBlackColor,
            radius: 23,
            child: Center(
              child: Icon(
                CupertinoIcons.play_fill,
                color: kWhiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
