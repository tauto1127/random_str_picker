// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'str_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StrModelImpl _$$StrModelImplFromJson(Map<String, dynamic> json) =>
    _$StrModelImpl(
      str: json['str'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      usedAt: json['usedAt'] == null
          ? null
          : DateTime.parse(json['usedAt'] as String),
      pickedAt: json['pickedAt'] == null
          ? null
          : DateTime.parse(json['pickedAt'] as String),
    );

Map<String, dynamic> _$$StrModelImplToJson(_$StrModelImpl instance) =>
    <String, dynamic>{
      'str': instance.str,
      'createdAt': instance.createdAt?.toIso8601String(),
      'usedAt': instance.usedAt?.toIso8601String(),
      'pickedAt': instance.pickedAt?.toIso8601String(),
    };
