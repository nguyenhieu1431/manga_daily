// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) {
  return HomeResponse(
    data: json['data'] == null
        ? null
        : HomeModel.fromJson(json['data'] as Map<String, dynamic>),
    message: json['message'] as String,
    statusCode: json['statusCode'] as int,
  );
}

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'message': instance.message,
      'statusCode': instance.statusCode,
    };

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) {
  return HomeModel(
    random: (json['random'] as List)
        ?.map((e) => e == null
            ? null
            : HomeItemModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    latest: (json['latest'] as List)
        ?.map((e) => e == null
            ? null
            : HomeItemModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hottest: (json['hotest'] as List)
        ?.map((e) => e == null
            ? null
            : HomeItemModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    completed: (json['completed'] as List)
        ?.map((e) => e == null
            ? null
            : HomeItemModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'random': instance.random?.map((e) => e?.toJson())?.toList(),
      'latest': instance.latest?.map((e) => e?.toJson())?.toList(),
      'hotest': instance.hottest?.map((e) => e?.toJson())?.toList(),
      'completed': instance.completed?.map((e) => e?.toJson())?.toList(),
    };

HomeItemModel _$HomeItemModelFromJson(Map<String, dynamic> json) {
  return HomeItemModel(
    id: json['_id'] as String,
    name: json['name'] as String,
    cover: json['cover'] as String,
  );
}

Map<String, dynamic> _$HomeItemModelToJson(HomeItemModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'cover': instance.cover,
    };
