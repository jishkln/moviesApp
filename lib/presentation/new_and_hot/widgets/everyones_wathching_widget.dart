import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colores.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;
  const EveryonesWatchingWidget({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHight,
          Text(
            movieName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 22),
          ),
          kHight,
          Text(
            description,
            maxLines: 4,
             overflow: TextOverflow.ellipsis, 

            style: const TextStyle(color: kGreycolor),
          ),
          kHight,
          VideoWidget(
            url: posterPath,
          ),
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
