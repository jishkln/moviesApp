import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failure/main_failure.dart';
import 'package:netflix/domain/downloads/i_download_rep.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:netflix/domain/search/model/search_repo/search_resp.dart';
import 'package:netflix/domain/search/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsServices;
  final SearchService _searchService;

  SearchBloc(this._downloadsServices, this._searchService)
      : super(SearchState.initial()) {
    //idel srate

    on<initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(state);
        return;
      }

      emit(
        const SearchState(
          searchResultList: [],
          idleList: [],
          isLoading: true,
          isError: false,
        ),
      );
//get
      final _result = await _downloadsServices.getDownloadsImages();

      final _state = _result.fold((MainFailure f) {
        return const SearchState(
          searchResultList: [],
          idleList: [],
          isLoading: false,
          isError: true,
        );
      }, (List<Downloads> list) {
        return SearchState(
            searchResultList: [],
            idleList: list,
            isLoading: false,
            isError: false);
      });
      emit(_state);
    });

    //search result

    on<searchMovie>((event, emit) async {
      emit(
        const SearchState(
          searchResultList: [],
          idleList: [],
          isLoading: true,
          isError: false,
        ),
      );
      final _result = await _searchService.searchMovie(
        movieQuery: event.movieQuery,
      );
      final _state = _result.fold(
        (MainFailure l) {
          return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true,
          );
        },
        (SearchResp r) {
          return SearchState(
            searchResultList: r.results,
            idleList: [],
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(_state);
    });
  }
}
