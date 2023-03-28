// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingModel _$$_SettingModelFromJson(Map<String, dynamic> json) =>
    _$_SettingModel(
      autoRead: json['autoRead'] as bool? ?? true,
      language: json['language'] as String? ?? 'en-US',
    );

Map<String, dynamic> _$$_SettingModelToJson(_$_SettingModel instance) =>
    <String, dynamic>{
      'autoRead': instance.autoRead,
      'language': instance.language,
    };
