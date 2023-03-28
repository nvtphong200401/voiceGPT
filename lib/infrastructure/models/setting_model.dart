import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_model.freezed.dart';
part 'setting_model.g.dart';

@freezed
class SettingModel with _$SettingModel {
  const SettingModel._();
  const factory SettingModel({
    @Default(true) bool autoRead,
    @Default('en-US') String language,
  }) = _SettingModel;
  factory SettingModel.fromJson(Map<String, dynamic> json) => _$SettingModelFromJson(json);
}
