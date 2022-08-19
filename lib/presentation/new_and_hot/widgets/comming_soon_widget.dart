import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colores.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/video_widget.dart';



class CommingSoonWidget extends StatelessWidget {
  const CommingSoonWidget({
    Key? key,
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
            children: const [
              Text(
                'FEB',
                style: TextStyle(
                  fontSize: 14,
                  color: kGreycolor,
                ),
              ),
              Text(
                '11',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
              const VideoWidget(),
              kHight,
              Row(
                children: [
                  kWidth,
                  Text(
                    'TallGirl 2',
                    style: GoogleFonts.montserrat(
                        fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  const Spacer(),
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
              const Text('Comming on Friday'),
              kHight,
              const Text(
                'Tall girl 2',
                style: kHomeTitleText,
              ),
              kHight,
              const Text(
                "Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident",
                style: TextStyle(color: kGreycolor),
              )
            ],
          ),
        ),
      ],
    );
  }
}

