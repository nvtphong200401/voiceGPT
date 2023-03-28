import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voicegpt/infrastructure/chat_repo.dart';

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
  factory ChatState.fromJson(Map<String, dynamic> json) => _$ChatStateFromJson(json);
}

class ChatNotifier extends ChangeNotifier {
  ChatNotifier(
      this._chatRepository //) : super(const ChatState.loading());
      ,
      this._sharedPreferences) {
    state = ChatState.fromJson(jsonDecode(_sharedPreferences.getString('messages') ??
        '{"oldMessages": [], "runtimeType": "loading"}'));
  }
  final ChatRepository _chatRepository;
  final SharedPreferences _sharedPreferences;
  late ChatState state;

  Future sendMessage(String txtMsg) async {
    final message = MessageModel(role: 'user', content: txtMsg);
    final messages = [...state.when(loading: (ms) => ms, data: (data) => data), message];
    // loading
    state = ChatState.loading(
        oldMessages: [...messages, const MessageModel(role: 'assistant', content: '_')]);
    notifyListeners();
    // send message
    final res = await _chatRepository.sendMessage(messages);
    // new message arrived
    final newData = [
      ...messages,
      res.fold((l) => const MessageModel(role: 'assistant', content: 'An error occur'), (r) {
        return r;
      }),
    ];
    // display on screen
    state = ChatState.data(messages: newData);
    notifyListeners();
    // save it to local storage
    _sharedPreferences.setString(
        'messages', jsonEncode(ChatState.loading(oldMessages: newData).toJson()));
  }

  Future clearMessage() async {
    state = ChatState.data(messages: []);
    _sharedPreferences.setString('messages', '{"oldMessages": [], "runtimeType": "loading"}');
    notifyListeners();
  }
}
