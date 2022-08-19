import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colores.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          width: double.infinity,
          height: 200,
          child: Image(
            image: NetworkImage(
                "https://www.themoviedb.org/t/p/w250_and_h141_face/sJDBJxKWG7h3VpG6jc9Mm9bw4kG.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black54,
            radius: 22,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                size: 30,
                color: kWhiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
