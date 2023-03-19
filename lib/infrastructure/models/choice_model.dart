import 'package:freezed_annotation/freezed_annotation.dart';

import 'message_model.dart';

part 'choice_model.freezed.dart';
part 'choice_model.g.dart';

@freezed
class ChoiceModel with _$ChoiceModel {
  const ChoiceModel._();
  const factory ChoiceModel({
    required int index,
    required MessageModel message,
    required String finishReason,
  }) = _ChoiceModel;
  factory ChoiceModel.fromJson(Map<String, dynamic> json) =>
      _$ChoiceModelFromJson(json);
}
