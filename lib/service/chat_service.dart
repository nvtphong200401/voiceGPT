import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voicegpt/infrastructure/models/chat_response_model.dart';
import 'package:voicegpt/infrastructure/models/failure.dart';

import '../core/constants.dart';
import '../infrastructure/models/message_model.dart';

class ChatService {
  final Dio _dio;
  ChatService(this._dio);
  String apiKey = '';

  Future<Either<Failure, ChatResponseModel>> sendMessage(List<MessageModel> messages) async {
    try {
      if (apiKey.isEmpty) {
        final getKey = await _dio.get('https://nvtphong200401.github.io/',
            options: Options(contentType: 'application/json'));
        apiKey = utf8.decode(base64Decode(jsonDecode(getKey.data)['api_key']));
        log(apiKey);
      }
      log('$messages');
      final res = await _dio.post('https://api.openai.com/v1/chat/completions',
          data: {'model': chatModel, 'messages': messages.map((e) => e.toJson()).toList()},
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $apiKey',
            },
          ));

      log('${res.data}');
      return right(ChatResponseModel.fromJson(res.data));
    } catch (err) {
      log('$err');
      return left(Failure(message: err.toString()));
    }
  }
}
