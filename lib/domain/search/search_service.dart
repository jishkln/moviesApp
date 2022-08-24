import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failure/main_failure.dart';
import 'package:netflix/domain/search/model/search_repo/search_resp.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchResp>> searchMovie({
    required String movieQuery,
  });
}
