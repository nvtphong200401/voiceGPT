import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_storage/get_storage.dart';

import '../infrastructure/chat_repo.dart';
import '../infrastructure/models/message_model.dart';

part 'chat_notifier.freezed.dart';
part 'chat_notifier.g.dart';

@freezed
class ChatState with _$ChatState {
  const ChatState._();
  const factory ChatState.loading({
    @Default([]) List<MessageModel> oldMessages,
  }) = _Loading;
  @JsonSerializable(explicitToJson: true)
  factory ChatState.data({
    required List<MessageModel> messages,
  }) = _Data;
  factory ChatState.fromJson(Map<String, dynamic> json) =>
      _$ChatStateFromJson(json);
}

class ChatNotifier extends ChangeNotifier {
  ChatNotifier(
      this._chatRepository //) : super(const ChatState.loading());
      ,
      this._sharedPreferences) {
    state = ChatState.fromJson(jsonDecode(
        _sharedPreferences.read<String?>('messages') ??
            '{"oldMessages": [], "runtimeType": "loading"}'));
  }
  final ChatRepository _chatRepository;
  final GetStorage _sharedPreferences;
  late ChatState state;

  Future sendMessage(String txtMsg) async {
    final message = MessageModel(role: 'user', content: txtMsg);
    final messages = [
      ...state.when(loading: (ms) => ms, data: (data) => data),
      message
    ];
    // loading
    state = ChatState.loading(oldMessages: [
      ...messages,
      const MessageModel(role: 'assistant', content: '_')
    ]);
    notifyListeners();
    // send message
    final res = await _chatRepository.sendMessage(messages);
    // new message arrived
    final newData = <MessageModel>[
      ...messages,
      res.fold(
          (l) =>
              const MessageModel(role: 'assistant', content: 'An error occur'),
          (r) {
        return r;
      }),
    ];
    // display on screen
    state = ChatState.data(messages: newData);
    notifyListeners();
    // save it to local storage
    _sharedPreferences.write('messages',
        jsonEncode(ChatState.loading(oldMessages: newData).toJson()));
  }

  Future clearMessage() async {
    state = ChatState.data(messages: []);
    _sharedPreferences.write(
        'messages', '{"oldMessages": [], "runtimeType": "loading"}');
    notifyListeners();
  }
}
