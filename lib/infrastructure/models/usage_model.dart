import 'package:freezed_annotation/freezed_annotation.dart';

part 'usage_model.freezed.dart';
part 'usage_model.g.dart';

@freezed
class UsageModel with _$UsageModel {
  const UsageModel._();
  const factory UsageModel({
    required int promptTokens,
    required int completionTokens,
    required int totalTokens,
  }) = _UssageModel;
  factory UsageModel.fromJson(Map<String, dynamic> json) =>
      _$UsageModelFromJson(json);
}
