import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/home/widgets/main_tltle_number.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrolNotifier = ValueNotifier(true);

const String logoImg =
    "https://static.vecteezy.com/system/resources/previews/006/874/233/original/netflix-logo-icon-on-white-background-free-vector.jpg";

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
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
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          );
                        } else if (state.hasError) {
                          return const Center(
                            child:
                                Text("Error While Loading comming soon List"),
                          );
                        }
//relesed past year
                        final _relesePastYear =
                            state.pastYearMovieList.map((m) {
                          return "$imageAppentUrl${m.posterPath}";
                        }).toList();
                        //trending
                        final _trending = state.treandingMovieList.map((m) {
                          return "$imageAppentUrl${m.posterPath}";
                        }).toList();
                        _trending.shuffle();

                        //tonsDrama
                        final _dtama = state.tenceDramaMovieList.map((m) {
                          return "$imageAppentUrl${m.posterPath}";
                        }).toList();
                        _dtama.shuffle();

                        //SouthIndia
                        final _southIndia = state.southIndianMovieList.map((m) {
                          return "$imageAppentUrl${m.posterPath}";
                        }).toList();
                        _southIndia.shuffle();
                        //Tv shows
                        final _top10TvShows =
                            state.southIndianMovieList.map((m) {
                          return "$imageAppentUrl${m.posterPath}";
                        }).toList();



                        return ListView(
                          children: [
                            const BackgroundCard(),
                            kHight,
                            MainTitleCard(
                              title: 'Relesed in the past year',
                              posterList: _relesePastYear,
                            ),
                            kHight,
                            MainTitleCard(
                              title: ' Trending Now',
                              posterList: _trending,
                            ),
                            kHight,
                            
                            
                            MainTItleNumberCard(
                              postersList: _top10TvShows.sublist(0, 10),
                            ),
                            kHight,
                            MainTitleCard(
                              title: ' Tense Drama',
                              posterList: _dtama,
                            ),
                            kHight,
                            MainTitleCard(
                              title: ' South Indian Cinima',
                              posterList: _southIndia,
                            ),
                            kHight,
                          ],
                        );
                      },
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
