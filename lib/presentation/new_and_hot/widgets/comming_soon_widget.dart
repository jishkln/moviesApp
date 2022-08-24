import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colores.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/video_widget.dart';

class CommingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;
  const CommingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 470,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style: const TextStyle(
                  fontSize: 14,
                  color: kGreycolor,
                ),
              ),
              Text(
                day,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                 VideoWidget(url: posterPath),
              kHight,
              Row(
                children: [
                  kWidth,
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                          fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  ),
                  //
                  ButtonMainScreen(
                    title: "remind me",
                    size: 12,
                    icon: Icons.notifications_none,
                  ),
                  kWidth,
                  ButtonMainScreen(
                    title: "info",
                    size: 12,
                    icon: Icons.info,
                  ),
                  kWidth,
                  kWidth
                ],
              ),
              kHight,
              Text('Comming on $day $month'),
              kHight,
              Text(
                movieName,
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: kHomeTitleText,
              ),
              kHight,
              Text(
                description,
                maxLines: 4,
                style: TextStyle(color: kGreycolor),
              )
            ],
          ),
        ),
      ],
    );
  }
}
