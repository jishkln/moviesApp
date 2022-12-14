import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failure/main_failure.dart';
import 'package:netflix/domain/hot_and_new/model/hot_and_new_resp.dart';

abstract class HotAndNewService {
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovieData();
  Future<Either<MainFailure, HotAndNewResp>> getHoteAndNewTvData();
}
