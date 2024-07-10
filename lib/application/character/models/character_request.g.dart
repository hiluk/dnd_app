// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterDtoImpl _$$CharacterDtoImplFromJson(Map<String, dynamic> json) =>
    _$CharacterDtoImpl(
      email: json['email'] as String,
      character: Character.fromJson(json['character'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CharacterDtoImplToJson(_$CharacterDtoImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'character': instance.character,
    };
