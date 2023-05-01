import 'dart:convert';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../infrastructure/models/setting_model.dart';
import '../../infrastructure/shared/providers.dart';
import '../chat_notifier.dart';
import '../voice_notifier.dart';

final prefProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final chatNotifierProvider =
    ChangeNotifierProvider.autoDispose<ChatNotifier>((ref) {
  return ChatNotifier(ref.watch(chatRepoProvider), ref.watch(prefProvider));
}, dependencies: [prefProvider]);

final voiceNotifierProvider =
    StateNotifierProvider.autoDispose<VoiceNotifier, VoiceState>((ref) {
  return VoiceNotifier();
});

final settingStateProvider = StateProvider.autoDispose((ref) {
  final setting =
      ref.read(prefProvider.select((value) => value.getString('settings')));
  return setting == null
      ? const SettingModel()
      : SettingModel.fromJson(jsonDecode(setting));
});

final textToSpeechProvider = Provider.autoDispose(
  (ref) {
    final FlutterTts textToSpeech = FlutterTts();
    textToSpeech.setLanguage(
        ref.watch(settingStateProvider.select((value) => value.language)));

    textToSpeech.setSpeechRate(0.5);

    textToSpeech.setVolume(1.0);

    textToSpeech.setPitch(1.0);
    return textToSpeech;
  },
);
