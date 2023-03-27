import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voicegpt/application/chat_notifier.dart';
import 'package:voicegpt/application/voice_notifier.dart';
import 'package:voicegpt/infrastructure/models/setting_model.dart';
import 'package:voicegpt/infrastructure/shared/providers.dart';

final chatNotifierProvider = StateNotifierProvider.autoDispose<ChatNotifier, ChatState>((ref) {
  return ChatNotifier(ref.watch(chatRepoProvider));
});

final voiceNotifierProvider = StateNotifierProvider.autoDispose<VoiceNotifier, VoiceState>((ref) {
  return VoiceNotifier();
});

final settingStateProvider = StateProvider.autoDispose((ref) => const SettingModel());

final textToSpeechProvider = Provider.autoDispose(
  (ref) {
    final FlutterTts textToSpeech = FlutterTts();
    textToSpeech.setLanguage(ref.watch(settingStateProvider.select((value) => value.language)));

    textToSpeech.setSpeechRate(0.5);

    textToSpeech.setVolume(1.0);

    textToSpeech.setPitch(1.0);
    return textToSpeech;
  },
);
