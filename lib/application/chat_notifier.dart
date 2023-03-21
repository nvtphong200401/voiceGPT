import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voicegpt/infrastructure/chat_repo.dart';

import '../infrastructure/models/message_model.dart';

part 'chat_notifier.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const ChatState._();
  const factory ChatState.loading({
    @Default([]) List<MessageModel> oldMessages,
  }) = _Loading;
  factory ChatState.data({
    required List<MessageModel> messages,
  }) = _Data;
}

class ChatNotifier extends StateNotifier<ChatState> {
  ChatNotifier(this._chatRepository) : super(ChatState.data(messages: []));
  final ChatRepository _chatRepository;

  Future sendMessage(String txtMsg) async {
    final message = MessageModel(role: 'user', content: txtMsg);
    final messages = [...state.when(loading: (ms) => ms, data: (data) => data), message];

    state = ChatState.loading(
        oldMessages: [...messages, const MessageModel(role: 'assistant', content: '_')]);
    final res = await _chatRepository.sendMessage(messages);
    state = ChatState.data(messages: [
      ...messages,
      res.fold((l) => const MessageModel(role: 'assistant', content: 'An error occur'), (r) => r),
    ]);
  }
}
