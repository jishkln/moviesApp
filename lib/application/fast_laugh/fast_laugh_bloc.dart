import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/i_download_rep.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final demmyVideoUrl = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4"
];

ValueNotifier<Set<int>> likedIndexNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownloadsRepo downloadServices,
  ) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      //Sending loading to ui

      emit(
        const FastLaughState(
          videoList: [],
          isLoading: true,
          isError: false,
        ),
      );

      //get trending movies
      final result = await downloadServices.getDownloadsImages();

      final _state = result.fold(
        (l) {
          return const FastLaughState(
            videoList: [],
            isLoading: false,
            isError: true,
          );
        },
        (resp) => FastLaughState(
          videoList: resp,
          isLoading: false,
          isError: false,
        ),
      );
      //send ui

      emit(_state);
    });
    on<LikeVideo>((event, emit) async {
      likedIndexNotifier.value.add(event.id);
      likedIndexNotifier.notifyListeners();
    });
    on<UnlikeVideo>((event, emit) async {
      likedIndexNotifier.value.remove(event.id);
      likedIndexNotifier.notifyListeners();
    });
  }
}
