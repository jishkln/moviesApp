import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failure/main_failure.dart';
import 'package:netflix/domain/hot_and_new/hot_and_new_services.dart';
import 'package:netflix/domain/hot_and_new/model/hot_and_new_resp.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService _homeSercvice;
  HomeBloc(this._homeSercvice) : super(HomeState.initial()) {
    //on event Gethomescreendata

    on<GetHomeScreenData>((event, emit) async {
      //sent loading to ui
      emit(state.copyWith(isLoading: true, hasError: false));

      //get data
      final _moveResult = await _homeSercvice.getHotAndNewMovieData();
      final _tvResult = await _homeSercvice.getHoteAndNewTvData();

      //tranform data

      final _stste1 = _moveResult.fold((MainFailure failure) {
        return HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          treandingMovieList: [],
          tenceDramaMovieList: [],
          treandingTvList: [],
          southIndianMovieList: [],
          isLoading: false,
          hasError: true,
        );
      }, (HotAndNewResp resp) {
        final pastYear = resp.results;
        pastYear.shuffle;
        final trending = resp.results;
        trending.shuffle;
        final dreamas = resp.results;
        dreamas.shuffle;
        final southIndian = resp.results;
        southIndian.shuffle;

        return HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: pastYear,
          treandingMovieList: trending,
          tenceDramaMovieList: dreamas,
          treandingTvList: state.treandingTvList,
          southIndianMovieList: southIndian,
          isLoading: false,
          hasError: false,
        );
      });
      emit(_stste1);

      final _state2 = _tvResult.fold((MainFailure failure) {
        return HomeState(
          pastYearMovieList: [],
          treandingMovieList: [],
          tenceDramaMovieList: [],
          treandingTvList: [],
          southIndianMovieList: [],
          isLoading: false,
          hasError: true,
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
        );
      }, (HotAndNewResp resp) {
        final top10Result = resp.results;
        return HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: state.pastYearMovieList,
          treandingMovieList: state.treandingMovieList,
          tenceDramaMovieList: state.tenceDramaMovieList,
          treandingTvList: top10Result,
          southIndianMovieList: state.southIndianMovieList,
          isLoading: false,
          hasError: false,
        );
      });

      //send to ui
      emit(_state2);
    });
  }
}
