import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voicegpt/infrastructure/chat_repo.dart';
import 'package:voicegpt/service/shared/providers.dart';

final chatRepoProvider = Provider.autoDispose<ChatRepository>((ref) {
  return ChatRepository(ref.watch(chatServiceProvider));
});
