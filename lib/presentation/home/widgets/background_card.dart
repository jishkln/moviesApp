import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colores.dart';
import 'package:netflix/core/constants.dart';

import 'custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .62,
          // color: (Colors.amber),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(kMainImage), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonMainScreen(
                  icon: (Icons.add),
                  title: "My List",
                ),
                _PlayButton(),
                ButtonMainScreen(
                  icon: (Icons.info),
                  title: "Info",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextButton _PlayButton() {
    return TextButton.icon(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kWhiteColor),
      ),
      icon: const Icon(
        Icons.play_arrow,
        size: 30,
        color: kBlackColor,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Play',
          style: TextStyle(fontSize: 20, color: kBlackColor),
        ),
      ),
    );
  }
}
