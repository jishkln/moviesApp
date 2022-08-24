import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/search/model/search_repo/search_resp.dart';
import 'package:netflix/domain/core/failure/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/search/search_service.dart';

@LazySingleton(as: SearchService)
class SearchImpli implements SearchService {
  @override
  Future<Either<MainFailure, SearchResp>> searchMovie(
      {required String movieQuery}) async {
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.search,
        queryParameters: {'query': movieQuery},
      );
     // log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResp.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioError catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
