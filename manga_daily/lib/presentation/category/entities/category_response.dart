import 'package:json_annotation/json_annotation.dart';
part 'category_response.g.dart';

@JsonSerializable(explicitToJson: true)
class MangaListResponse{
  final MangaModel data;
  final String message;
  final int statusCode;

  MangaListResponse({this.data, this.message, this.statusCode});
  factory MangaListResponse.fromJson(Map<String, dynamic> json) => _$MangaListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MangaListResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MangaModel{
  final List<MangaItemModel> list;

  MangaModel({this.list});
  factory MangaModel.fromJson(Map<String, dynamic> json) => _$MangaModelFromJson(json);
  Map<String, dynamic> toJson() => _$MangaModelToJson(this);
}

@JsonSerializable()
class MangaItemModel {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String cover;
  final bool isHot;
  final int followed;
  final int status;
  final String updatedAt;
  final int viewed;
  MangaItemModel({this.id, this.name, this.cover, this.isHot, this.followed, this.status, this.updatedAt, this.viewed});
  factory MangaItemModel.fromJson(Map<String, dynamic> json) => _$MangaItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$MangaItemModelToJson(this);
}