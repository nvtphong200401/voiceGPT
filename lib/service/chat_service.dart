import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voicegpt/core/constants.dart';
import 'package:voicegpt/infrastructure/models/chat_response_model.dart';
import 'package:voicegpt/infrastructure/models/failure.dart';

import '../infrastructure/models/message_model.dart';

class ChatService {
  final Dio _dio;
  ChatService(this._dio);

  Future<Either<Failure, ChatResponseModel>> sendMessage(
      List<MessageModel> messages) async {
    try {
      final res =
          await _dio.get('', data: {'model': chatModel, 'message': messages});
      return right(ChatResponseModel.fromJson(res.data));
    } catch (err) {
      return left(Failure(message: err.toString()));
    }
  }
}
