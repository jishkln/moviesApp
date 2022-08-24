import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/core/colors/colores.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoListInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;
  const VideoListInheritedWidget({
    Key? key,
    required this.widget,
    required this.movieData,
  }) : super(key: key, child: widget);

  @override
  bool updateShouldNotify(covariant VideoListInheritedWidget oldWidget) {
    return (oldWidget.movieData != movieData);
  }

  static VideoListInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListInheritedWidget.of(context)?.movieData.posterpath;
    final videoUrl = demmyVideoUrl[index % demmyVideoUrl.length];
    return Stack(
      children: [
        FastLaughVideoPlayer(videoUrl: videoUrl, onStageChanged: (bool) {}),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side
                CircleAvatar(
                  backgroundColor: Colors.black54,
                  radius: 30,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      size: 30,
                      color: kWhiteColor,
                    ),
                  ),
                ),
                //right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          NetworkImage('$imageAppentUrl$posterPath'),
                    ),
                    ValueListenableBuilder(
                        valueListenable: likedIndexNotifier,
                        builder:
                            (BuildContext context, Set<int> newlikedids, _) {
                          final _index = index;
                          if (newlikedids.contains(_index)) {
                            return GestureDetector(
                              onTap: () {
                                // BlocProvider.of<FastLaughBloc>(context)
                                //     .add(UnlikeVideo(id: _index));
                                likedIndexNotifier.value.remove(_index);
                                likedIndexNotifier.notifyListeners();
                              },
                              child: const VideoActionWidget(
                                icon: (Icons.favorite),
                                title: 'Like',
                              ),
                            );
                          }
                          return GestureDetector(
                            onTap: () {
                              // BlocProvider.of<FastLaughBloc>(context)
                              //     .add(UnlikeVideo(id: _index));
                              likedIndexNotifier.value.add(_index);
                              likedIndexNotifier.notifyListeners();
                            },
                            child: const VideoActionWidget(
                              icon: (Icons.emoji_emotions),
                              title: 'Lol',
                            ),
                          );
                        }),
                    const VideoActionWidget(
                      icon: (Icons.add),
                      title: 'My List',
                    ),
                    GestureDetector(
                      onTap: () {
                        final movieName = VideoListInheritedWidget.of(context)
                            ?.movieData
                            .posterpath;
                        if (movieName != null) {
                          Share.share(movieName);
                        }
                        return;
                      },
                      child: const VideoActionWidget(
                        icon: (Icons.share),
                        title: 'Share',
                      ),
                    ),
                    const VideoActionWidget(
                      icon: (Icons.play_circle),
                      title: 'play',
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidget({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kWhiteColor,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(
              color: kWhiteColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStageChanged;
  const FastLaughVideoPlayer(
      {Key? key, required this.videoUrl, required this.onStageChanged})
      : super(key: key);
  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(
              strokeWidth: 2,
            )),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
