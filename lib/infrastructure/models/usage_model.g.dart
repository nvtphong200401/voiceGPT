// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UssageModel _$$_UssageModelFromJson(Map<String, dynamic> json) =>
    _$_UssageModel(
      promptTokens: json['promptTokens'] as int,
      completionTokens: json['completionTokens'] as int,
      totalTokens: json['totalTokens'] as int,
    );

Map<String, dynamic> _$$_UssageModelToJson(_$_UssageModel instance) =>
    <String, dynamic>{
      'promptTokens': instance.promptTokens,
      'completionTokens': instance.completionTokens,
      'totalTokens': instance.totalTokens,
    };
