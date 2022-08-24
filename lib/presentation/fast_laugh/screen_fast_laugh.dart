import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/presentation/fast_laugh/widget/video_lish_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(
        const Initialize(),
      );
    });
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FastLaughBloc, FastLaughState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.isError) {
              // BaseOptions errorBase=  BaseOptions(receiveDataWhenStatusError: true,receiveTimeout: 60*1000,connectTimeout: 60*1000);
              return const Center(
                child: Text('Error While getting Data'),
              );
            } else if (state.videoList.isEmpty) {
              return const Center(
                child: Text('video list is empty'),
              );
            } else {
              return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(
                  state.videoList.length,
                  (index) {
                    return VideoListInheritedWidget(
                        widget: VideoListItem(
                            key: Key(index.toString()), index: index),
                        movieData: state.videoList[index]);
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
