import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflix/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix/core/colors/colores.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/new_and_hot/widgets/comming_soon_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/everyones_wathching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            backgroundColor: kBlackColor,
            title: Text(
              "Hot & New",
              style: GoogleFonts.montserrat(
                  fontSize: 30, fontWeight: FontWeight.w700),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 30,
              ),
              kWidth,
              Container(
                width: 30,
                height: 10,
                color: Colors.amber,
              ),
              kWidth,
            ],
            bottom: TabBar(
                unselectedLabelColor: kWhiteColor,
                labelColor: kBlackColor,
                labelStyle: kHomeTitleText,
                indicator:
                    BoxDecoration(color: kWhiteColor, borderRadius: kRadius30),
                tabs: const [
                  Tab(
                    text: "🍿 Comming Soon",
                  ),
                  Tab(text: "👀 Everyone's Watching"),
                ]),
          ),
        ),
        body: const TabBarView(
          children: [
            ComingSoonList(),
            EveryOneIsWatchingList(),
          ],
        ),
      ),
    );
  }

  Widget _BuildEveryonesWatching() {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: ((context, index) =>
          // const EveryonesWatchingWidget(),
          const SizedBox()),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInCommingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInCommingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text("Error While Loading comming soon List"),
            );
          } else if (state.commingSoonList.isEmpty) {
            return const Center(
              child: Text("  comming soon List is empty"),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.only(top: 20),
              itemCount: state.commingSoonList.length,
              itemBuilder: ((BuildContext context, index) {
                final movie = state.commingSoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                String month = '';
                String date = '';

                try {
                  final _date = DateTime.parse(movie.releaseDate!);
                  final formatedDate = DateFormat.yMMMMd('en_US').format(_date);
                  month = formatedDate
                      .split(' ')
                      .first
                      .substring(0, 3)
                      .toLowerCase();
                  date = movie.releaseDate!.split('-')[1];
                } catch (_) {
                  month = '';
                  date = "";
                }

                return CommingSoonWidget(
                  id: movie.id.toString(),
                  month: month,
                  day: date,
                  posterPath: '$imageAppentUrl${movie.posterPath}',
                  movieName: movie.originalTitle ?? 'No Titie',
                  description: movie.overview ?? 'No Overview',
                );
              }),
            );
          }
        },
      ),
    );
  }
}

class EveryOneIsWatchingList extends StatelessWidget {
  const EveryOneIsWatchingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryOneIsWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInEveryOneIsWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text("Error While Loading comming soon List"),
            );
          } else if (state.everyOneIsWatchingList.isEmpty) {
            return const Center(
              child: Text("  comming soon List is empty"),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: state.everyOneIsWatchingList.length,
              itemBuilder: ((BuildContext context, index) {
                final movie = state.everyOneIsWatchingList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }

                final tv = state.everyOneIsWatchingList[index];

                return EveryonesWatchingWidget(
                    posterPath: '$imageAppentUrl${tv.posterPath}',
                    movieName: tv.originalName ?? 'No Name',
                    description: tv.overview ?? 'No Discription');
              }),
            );
          }
        },
      ),
    );
  }
}
