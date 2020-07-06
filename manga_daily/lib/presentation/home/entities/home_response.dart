import 'package:json_annotation/json_annotation.dart';
part 'home_response.g.dart';

@JsonSerializable(explicitToJson: true)
class HomeResponse{
  final HomeModel data;
  final String message;
  final int statusCode;

  HomeResponse({this.data, this.message, this.statusCode});
  factory HomeResponse.fromJson(Map<String, dynamic> json) => _$HomeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HomeModel{
  final List<HomeItemModel> random;
  final List<HomeItemModel> latest;
  @JsonKey(name: 'hotest')
  final List<HomeItemModel> hottest;
  final List<HomeItemModel> completed;

  HomeModel({this.random, this.latest, this.hottest, this.completed });
  factory HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}

@JsonSerializable()
class HomeItemModel {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String cover;
  HomeItemModel({this.id, this.name, this.cover});
  factory HomeItemModel.fromJson(Map<String, dynamic> json) => _$HomeItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeItemModelToJson(this);
}