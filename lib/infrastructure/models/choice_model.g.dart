// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChoiceModel _$$_ChoiceModelFromJson(Map<String, dynamic> json) =>
    _$_ChoiceModel(
      index: json['index'] as int?,
      message: MessageModel.fromJson(json['message'] as Map<String, dynamic>),
      finishReason: json['finish_reason'] as String,
    );

Map<String, dynamic> _$$_ChoiceModelToJson(_$_ChoiceModel instance) =>
    <String, dynamic>{
      'index': instance.index,
      'message': instance.message,
      'finish_reason': instance.finishReason,
    };
