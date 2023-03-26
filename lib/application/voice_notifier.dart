import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'voice_notifier.freezed.dart';

@freezed
class VoiceState with _$VoiceState {
  const VoiceState._();
  const factory VoiceState.stop() = _Stop;
  const factory VoiceState.listening(String data) = _Listening;
}

class VoiceNotifier extends StateNotifier<VoiceState> {
  VoiceNotifier() : super(const VoiceState.stop());

  final SpeechToText _speechToText = SpeechToText();

  Future<bool> initialize() async {
    final permission = await _speechToText.initialize(debugLogging: true);
    log('something here');
    if (permission) {
      log('here');
      _speechToText.listen(
        onResult: (result) =>
            state = VoiceState.listening(result.recognizedWords),
      );
    }
    return permission;
  }

  Future<void> stop() async {
    state = const VoiceState.stop();
    _speechToText.stop();
  }
}
