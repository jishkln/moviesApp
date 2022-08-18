import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colores.dart';
import 'package:netflix/core/constants.dart';

class NumberCardWidget extends StatelessWidget {
  const NumberCardWidget({Key? key, required this.imgUrl, required this.index})
      : super(key: key);
  final String imgUrl;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 250,
            ),
            Container(
              width: 150,
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        imgUrl,
                      ),
                      fit: BoxFit.cover),
                  borderRadius: kRadius10),
            ),
          ],
        ),
        Positioned(
          left: 0,
          bottom: -27,
          child: BorderedText(
            strokeColor: kWhiteColor,
            strokeWidth: 4,
            child: Text(
              "${index + 1}",
              style: GoogleFonts.roboto(
                color: kBlackColor,
                decoration: TextDecoration.none,
                decorationColor: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 120,
              ),
            ),
          ),
        )
      ],
    );
  }
}
