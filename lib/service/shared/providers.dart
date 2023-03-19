import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voicegpt/service/chat_service.dart';

final dioOptions = Provider.autoDispose<BaseOptions>((ref) {
  return BaseOptions(
      baseUrl: 'https://api.openai.com/v1/chat/completions',
      headers: {
        'Authorization':
            'Bearer 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',
      },
      contentType: ContentType.json.mimeType);
});

final openAIClient = Provider.autoDispose((ref) => Dio());

final chatServiceProvider = Provider.autoDispose<ChatService>((ref) {
  return ChatService(ref.watch(openAIClient));
});
