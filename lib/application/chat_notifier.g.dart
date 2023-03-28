// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_notifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Loading _$$_LoadingFromJson(Map<String, dynamic> json) => _$_Loading(
      oldMessages: (json['oldMessages'] as List<dynamic>?)
              ?.map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_LoadingToJson(_$_Loading instance) =>
    <String, dynamic>{
      'oldMessages': instance.oldMessages,
      'runtimeType': instance.$type,
    };

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      messages: (json['messages'] as List<dynamic>)
          .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'messages': instance.messages.map((e) => e.toJson()).toList(),
      'runtimeType': instance.$type,
    };
