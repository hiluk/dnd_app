// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorResponseImpl _$$ErrorResponseImplFromJson(Map<String, dynamic> json) =>
    _$ErrorResponseImpl(
      type: json['type'] as String,
      title: json['title'] as String,
      status: (json['status'] as num).toInt(),
      detail: json['detail'] as String,
    );

Map<String, dynamic> _$$ErrorResponseImplToJson(_$ErrorResponseImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'status': instance.status,
      'detail': instance.detail,
    };
