import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colores.dart';
import 'package:netflix/presentation/downloades/screen_downloads.dart';
import 'package:netflix/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/main_page/widgets/bottum_nav.dart';
import 'package:netflix/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix/presentation/scearch/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);

  final _pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownload(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
