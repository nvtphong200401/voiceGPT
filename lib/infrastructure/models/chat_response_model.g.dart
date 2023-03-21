// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatResponseModel _$$_ChatResponseModelFromJson(Map<String, dynamic> json) =>
    _$_ChatResponseModel(
      id: json['id'] as String,
      object: json['object'] as String?,
      created: json['created'] as int?,
      usage: UsageModel.fromJson(json['usage'] as Map<String, dynamic>),
      choices: (json['choices'] as List<dynamic>)
          .map((e) => ChoiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ChatResponseModelToJson(
        _$_ChatResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'usage': instance.usage,
      'choices': instance.choices,
    };
