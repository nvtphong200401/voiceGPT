import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voicegpt/application/chat_notifier.dart';
import 'package:voicegpt/application/voice_notifier.dart';
import 'package:voicegpt/infrastructure/shared/providers.dart';

final chatNotifierProvider =
    StateNotifierProvider.autoDispose<ChatNotifier, ChatState>((ref) {
  return ChatNotifier(ref.watch(chatRepoProvider));
});

final voiceNotifierProvider =
    StateNotifierProvider<VoiceNotifier, VoiceState>((ref) {
  return VoiceNotifier();
});
