import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../chat_service.dart';

// final dioOptions = Provider.autoDispose<BaseOptions>((ref) {
//   return BaseOptions(
//       // baseUrl: 'https://api.openai.com/v1/chat/completions',
//       headers: ,
//       contentType: ContentType.json.mimeType);
// });

final openAIClient = Provider.autoDispose((ref) => Dio());

final chatServiceProvider = Provider.autoDispose<ChatService>((ref) {
  return ChatService(ref.watch(openAIClient));
});

final scrollProvider = Provider.autoDispose((ref) => ScrollController());
