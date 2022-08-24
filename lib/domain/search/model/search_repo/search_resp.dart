import 'package:json_annotation/json_annotation.dart';
import 'package:netflix/core/constants.dart';
part 'search_resp.g.dart';

@JsonSerializable()
class SearchResp {


  @JsonKey(name: 'results')
  List<SearchResultData> results;

  SearchResp({this.results = const []});

  factory SearchResp.fromJson(Map<String, dynamic> json) =>
      _$SearchRespFromJson(json);

  Map<String, dynamic> toJson() => _$SearchRespToJson(this);
}

@JsonSerializable()
class SearchResultData {
  @JsonKey(name: "original_language")
  String? originalTitle;

  @JsonKey(name: "poster_path")
  String? posterPath;

  SearchResultData({this.originalTitle, this.posterPath});
  

  factory SearchResultData.fromJson(Map<String, dynamic> json) =>
      _$SearchResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultDataToJson(this);
}
