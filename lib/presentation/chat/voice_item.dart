import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voicegpt/application/shared/providers.dart';

import '../animation/ripple_animation.dart';

class VoiceItem extends HookConsumerWidget {
  const VoiceItem({super.key, required this.messageController, this.onSendMessage});
  final TextEditingController messageController;
  final void Function()? onSendMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final voiceAnimation = useAnimationController(duration: const Duration(seconds: 2));

    final listening = ref.watch(voiceNotifierProvider).when(stop: () {
      return false;
    }, listening: (data) {
      messageController.text = data;
      return true;
    });

    final bool emptyMessage =
        useListenableSelector(messageController, () => messageController.text.trim().isEmpty);

    return !emptyMessage && !listening
        ? InkWell(
            borderRadius: BorderRadius.circular(100.0),
            onTap: onSendMessage,
            child: SizedBox(
              child: buildIcon(Icons.send_rounded),
              width: 82.5,
            ),
          )
        : RipplesAnimation(
            child: buildIcon(Icons.mic),
            controller: voiceAnimation,
            size: 20,
          );
  }

  buildIcon(data) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 7.5),
        child: Icon(data, size: 20, color: Colors.white),
      );
}
