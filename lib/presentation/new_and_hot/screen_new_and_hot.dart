import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colores.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/comming_soon_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/everyones_wathching_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/video_widget.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

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
        body: TabBarView(
          children: [
            _BuildCommingSoon(context),
            _BuildEveryonesWatching(),
          ],
        ),
      ),
    );
  }

  Widget _BuildCommingSoon(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: ((context, index) {
        return const CommingSoonWidget();
      }),
    );
  }

  Widget _BuildEveryonesWatching() {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: ((context, index) => const EveryonesWatchingWidget()),
    );
  }
}
