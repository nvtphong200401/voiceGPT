// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UssageModel _$$_UssageModelFromJson(Map<String, dynamic> json) =>
    _$_UssageModel(
      promptTokens: json['prompt_tokens'] as int?,
      completionTokens: json['completion_tokens'] as int?,
      totalTokens: json['total_tokens'] as int?,
    );

Map<String, dynamic> _$$_UssageModelToJson(_$_UssageModel instance) =>
    <String, dynamic>{
      'prompt_tokens': instance.promptTokens,
      'completion_tokens': instance.completionTokens,
      'total_tokens': instance.totalTokens,
    };
