import 'package:freezed_annotation/freezed_annotation.dart';

part 'usage_model.freezed.dart';
part 'usage_model.g.dart';

@freezed
class UsageModel with _$UsageModel {
  const UsageModel._();
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UsageModel({
    int? promptTokens,
    int? completionTokens,
    int? totalTokens,
  }) = _UssageModel;
  factory UsageModel.fromJson(Map<String, dynamic> json) => _$UsageModelFromJson(json);
}
