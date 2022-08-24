import 'package:netflix/core/string.dart';
import 'package:netflix/infrastructure/api_key.dart';

class ApiEndPoints {
  static const dounloads = "$kBaseUrl/trending/all/day?api_key=$apiKey";
  static const search = "$kBaseUrl/search/movie?api_key=$apiKey";

  static const hotAndNewMovie = "$kBaseUrl/discover/movie?api_key=$apiKey";
  static const hotAndNewTv = "$kBaseUrl/discover/tv?api_key=$apiKey";
}
