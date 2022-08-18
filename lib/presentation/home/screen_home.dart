import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/main_tltle_number.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

const String imgUrl =
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg";

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .62,
                // color: (Colors.amber),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(kMainImage),
                  ),
                ),
              ),
              kHight,
              const MainTitleCard(
                title: 'Relesed in the past year',
              ),
              kHight,
              const MainTitleCard(
                title: ' Trending Now',
              ),
              kHight,
              const MainTItleNumberCard(
                imgUrl: imgUrl,
              ),
              kHight,
              const MainTitleCard(
                title: ' Tense Drama',
              ),
              kHight,
              const MainTitleCard(
                title: ' South Indian Cinima',
              ),
              kHight,
            ],
          ),
        ),
      ),
    );
  }
}
