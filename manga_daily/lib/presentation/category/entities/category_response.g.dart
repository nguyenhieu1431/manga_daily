// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MangaListResponse _$MangaListResponseFromJson(Map<String, dynamic> json) {
  return MangaListResponse(
    data: json['data'] == null
        ? null
        : MangaModel.fromJson(json['data'] as Map<String, dynamic>),
    message: json['message'] as String,
    statusCode: json['statusCode'] as int,
  );
}

Map<String, dynamic> _$MangaListResponseToJson(MangaListResponse instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'message': instance.message,
      'statusCode': instance.statusCode,
    };

MangaModel _$MangaModelFromJson(Map<String, dynamic> json) {
  return MangaModel(
    list: (json['list'] as List)
        ?.map((e) => e == null
            ? null
            : MangaItemModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MangaModelToJson(MangaModel instance) =>
    <String, dynamic>{
      'list': instance.list?.map((e) => e?.toJson())?.toList(),
    };

MangaItemModel _$MangaItemModelFromJson(Map<String, dynamic> json) {
  return MangaItemModel(
    id: json['_id'] as String,
    name: json['name'] as String,
    cover: json['cover'] as String,
    isHot: json['isHot'] as bool,
    followed: json['followed'] as int,
    status: json['status'] as int,
    updatedAt: json['updatedAt'] as String,
    viewed: json['viewed'] as int,
  );
}

Map<String, dynamic> _$MangaItemModelToJson(MangaItemModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'cover': instance.cover,
      'isHot': instance.isHot,
      'followed': instance.followed,
      'status': instance.status,
      'updatedAt': instance.updatedAt,
      'viewed': instance.viewed,
    };
