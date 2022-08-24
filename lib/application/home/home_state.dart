part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String stateId,
    required List<HotAndNewData> pastYearMovieList,
    required List<HotAndNewData> treandingMovieList,
    required List<HotAndNewData> tenceDramaMovieList,
    required List<HotAndNewData> treandingTvList,
    required List<HotAndNewData> southIndianMovieList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory HomeState.initial() => const HomeState(
      pastYearMovieList: [],
      treandingMovieList: [],
      tenceDramaMovieList: [],
      treandingTvList: [],
      southIndianMovieList: [],
      isLoading: false,
      hasError: false, stateId: '0');
}
