import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colores.dart';

class VideoWidget extends StatelessWidget {
  final String url;
  const VideoWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image(
            image: NetworkImage(url),
            fit: BoxFit.cover,
            loadingBuilder: (_, child, ImageChunkEvent? progress) {
              if (progress == null) {
                return child;
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                );
              }
            },
            errorBuilder: (_, Object a, StackTrace? trace) {
              return const Center(
                  child: Icon(
                Icons.wifi,
                color: kWhiteColor,
              ));
            },
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
