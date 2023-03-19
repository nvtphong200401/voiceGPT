import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voicegpt/infrastructure/models/choice_model.dart';
import 'package:voicegpt/infrastructure/models/usage_model.dart';

part 'chat_response_model.freezed.dart';
part 'chat_response_model.g.dart';

@freezed
class ChatResponseModel with _$ChatResponseModel {
  const ChatResponseModel._();
  const factory ChatResponseModel({
    required String id,
    required String object,
    required String created,
    required UsageModel usage,
    required List<ChoiceModel> choice,
  }) = _ChatResponseModel;
  factory ChatResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseModelFromJson(json);
}
