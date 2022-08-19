import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/home/widgets/main_tltle_number.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrolNotifier = ValueNotifier(true);

const String imgUrl =
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg";
const String logoImg =
    "https://static.vecteezy.com/system/resources/previews/006/874/233/original/netflix-logo-icon-on-white-background-free-vector.jpg";

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrolNotifier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                    scrolNotifier.value = false;
                  } else {
                    if (direction == ScrollDirection.forward) {
                      scrolNotifier.value = true;
                    }
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(
                      children: const [
                        BackgroundCard(),
                        kHight,
                        MainTitleCard(
                          title: 'Relesed in the past year',
                        ),
                        kHight,
                        MainTitleCard(
                          title: ' Trending Now',
                        ),
                        kHight,
                        MainTItleNumberCard(
                          imgUrl: imgUrl,
                        ),
                        kHight,
                        MainTitleCard(
                          title: ' Tense Drama',
                        ),
                        kHight,
                        MainTitleCard(
                          title: ' South Indian Cinima',
                        ),
                        kHight,
                      ],
                    ),
                    scrolNotifier.value == true
                        ? AnimatedContainer(
                            width: double.infinity,
                            height: 90,
                            color: Colors.black.withOpacity(0.1),
                            duration: Duration(milliseconds: 5500),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Image(
                                      image: NetworkImage(
                                        logoImg,
                                      ),
                                      width: 50,
                                      height: 50,
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.cast,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    kWidth,
                                    Container(
                                      width: 30,
                                      height: 30,
                                      color: Colors.amber,
                                    ),
                                    kWidth,
                                  ],
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Text(
                                        'Tv Show',
                                        style: kHomeTitleText,
                                      ),
                                      Text(
                                        'Movies',
                                        style: kHomeTitleText,
                                      ),
                                      Text(
                                        'Categories',
                                        style: kHomeTitleText,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        : kHight
                  ],
                ),
              );
            }));
  }
}
