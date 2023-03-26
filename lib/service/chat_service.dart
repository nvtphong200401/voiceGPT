import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voicegpt/infrastructure/models/chat_response_model.dart';
import 'package:voicegpt/infrastructure/models/failure.dart';

import '../infrastructure/models/message_model.dart';

class ChatService {
  final Dio _dio;
  ChatService(this._dio);

  Future<Either<Failure, ChatResponseModel>> sendMessage(
      List<MessageModel> messages) async {
    try {
      log('call servicce');
      // final res = await _dio.post('https://api.openai.com/v1/chat/completions',
      //     data: {'model': chatModel, 'messages': messages.map((e) => e.toJson()).toList()},
      //     options: Options(
      //       headers: {
      //         'Content-Type': 'application/json',
      //         'Authorization': 'Bearer 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',
      //       },
      //     ));

      // log('${res.data}');
      return right(ChatResponseModel.mockData());
    } catch (err) {
      log('$err');
      return left(Failure(message: err.toString()));
    }
  }
}
