import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failure/main_failure.dart';
import 'package:netflix/domain/downloads/i_download_rep.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _dowmloadRepo;

  DownloadsBloc(this._dowmloadRepo)
      : super(
          DownloadsState.inital(),
        ) {
    on<_getDownloadsEvent>(
      (event, emit) async {
        emit(
          state.copyWith(
            isLoading: true,
            downloadsFailuresOrSucessOptions: none(),
          ),
        );
        final Either<MainFailure, List<Downloads>> downloadsOption =
            await _dowmloadRepo.getDownloadsImages();
        // log(downloadsOption.toString());
        emit(
          downloadsOption.fold(
            (failer) => state.copyWith(
              isLoading: false,
              downloadsFailuresOrSucessOptions: some(
                Left(failer),
              ),
            ),
            (sucess) => state.copyWith(
              isLoading: false,
              downloads: sucess,
              downloadsFailuresOrSucessOptions: some(
                Right(sucess),
              ),
            ),
          ),
        );
      },
    );
  }
}
