import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failure/main_failure.dart';
import 'package:netflix/domain/hot_and_new/hot_and_new_services.dart';
import 'package:netflix/domain/hot_and_new/model/hot_and_new_resp.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;

  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    //movie data

    on<LoadDataInCommingSoon>((event, emit) async {
//loading ui

      emit(
        const HotAndNewState(
          commingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: true,
          hasError: false,
        ),
      );

//get data to remote
      final _result = await _hotAndNewService.getHotAndNewMovieData();

      final newState = _result.fold((MainFailure failure) {
//data to state
        return const HotAndNewState(
          commingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: false,
          hasError: true,
        );
      }, (HotAndNewResp resp) {
        return HotAndNewState(
            commingSoonList: resp.results,
            everyOneIsWatchingList: state.everyOneIsWatchingList,
            isLoading: false,
            hasError: false);
      });
      emit(newState);
    });

    //tv Data

    on<LoadDataInEveryOneIsWatching>((event, emit) async {
      emit(
        const HotAndNewState(
          commingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: true,
          hasError: false,
        ),
      );

//get data to remote
      final _result = await _hotAndNewService.getHoteAndNewTvData();

      final newState = _result.fold((MainFailure failure) {
//data to state
        return const HotAndNewState(
          commingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: false,
          hasError: true,
        );
      }, (HotAndNewResp resp) {
        return HotAndNewState(
            commingSoonList: state.commingSoonList,
            everyOneIsWatchingList: resp.results,
            isLoading: false,
            hasError: false);
      });
      emit(newState);
    });
  }
}
