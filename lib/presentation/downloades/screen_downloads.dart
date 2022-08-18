import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colores.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({Key? key}) : super(key: key);
  final _widgetList = [
    const _SmartDownloads(),
    _Section2(),
    _Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Downloads',
          )),
      body: SafeArea(
          child: ListView.separated(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 25, bottom: 10),
              itemBuilder: ((context, index) => _widgetList[index]),
              separatorBuilder: ((context, index) => const SizedBox(
                    height: 20,
                  )),
              itemCount: _widgetList.length)),
    );
  }
}

class _Section2 extends StatelessWidget {
  _Section2({Key? key}) : super(key: key);
  final List imageList = [
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/vUUqzWa2LnHIVqkaKVlVGkVcZIW.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          'Indroducing downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22, color: kWhiteColor, fontWeight: FontWeight.bold),
        ),
        kHight,
        const Text(
          "We'll download a personllised selection of\nmovies and shows for you, so there's\nalways something to watch on your\ndevice.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.2),
        ),
        kHight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: size.width * 0.34,
                  backgroundColor: Colors.grey.withOpacity(0.8),
                ),
              ),
              DownloadImageWidget(
                imageList: imageList[0],
                margin: const EdgeInsets.only(left: 160, bottom: 40, top: 25),
                angle: 20,
                size: Size(size.width * .8, size.height * 0.5),
              ),
              DownloadImageWidget(
                imageList: imageList[1],
                margin: const EdgeInsets.only(right: 160, bottom: 40, top: 25),
                angle: -20,
                size: Size(size.width * .8, size.height * 0.5),
              ),
              DownloadImageWidget(
                imageList: imageList[2],
                margin: const EdgeInsets.only(right: 0, bottom: 2, top: 15),
                size: Size(size.width * .95, size.height * 0.5),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _Section3 extends StatelessWidget {
  const _Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColorBlue,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "Set up",
              style: TextStyle(
                  color: kButtonColorWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        MaterialButton(
          color: kButtonColorWhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "See what you can download",
            style: TextStyle(
              color: kBlackColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: kButtonColorWhite,
        ),
        kWidth,
        Text('Smart Downloads'),
      ],
    );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget({
    Key? key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  //final double radis;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width * 0.4,
        height: size.width * 0.58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(
                imageList,
              ),
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}
