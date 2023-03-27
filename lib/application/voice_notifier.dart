import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'voice_notifier.freezed.dart';

@freezed
class VoiceState with _$VoiceState {
  const VoiceState._();
  const factory VoiceState.stop() = VoiceStop;
  const factory VoiceState.listening(String data) = VoiceListening;
}

class VoiceNotifier extends StateNotifier<VoiceState> {
  VoiceNotifier() : super(const VoiceState.stop());

  final SpeechToText _speechToText = SpeechToText();

  Future<bool> initialize(String locale) async {
    final permission = await _speechToText.initialize(
      debugLogging: true,
      onStatus: (status) {
        if (status == SpeechToText.doneStatus || status == SpeechToText.notListeningStatus) {
          log('stop listening');
          state = const VoiceState.stop();
        }
      },
    );

    if (permission) {
      state = const VoiceState.listening('');
      _speechToText.listen(
        listenMode: ListenMode.dictation,
        localeId: locale,
        onResult: (result) => state = VoiceState.listening(result.recognizedWords),
      );
    }
    return permission;
  }

  Future<void> stop() async {
    await _speechToText.stop();
    // state = const VoiceState.stop();
  }
}
