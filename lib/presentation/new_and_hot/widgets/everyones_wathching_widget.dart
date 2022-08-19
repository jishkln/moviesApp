import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colores.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHight,
          const Text(
            'Friends',
            style: TextStyle(fontSize: 16),
          ),
          kHight,
          const Text(
            "Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident",
            style: TextStyle(color: kGreycolor),
          ),
          kHight,
          const VideoWidget(),
          kHight,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ButtonMainScreen(title: 'share', icon: Icons.share),
              kWidth,
              ButtonMainScreen(title: 'add', icon: Icons.add),
              kWidth,
              ButtonMainScreen(title: 'play', icon: Icons.play_arrow),
              kWidth,
            ],
          )
        ],
      ),
    );
  }
}
