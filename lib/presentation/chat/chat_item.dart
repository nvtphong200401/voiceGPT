import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/shared/providers.dart';
import '../../infrastructure/models/message_model.dart';
import '../widgets/animation_text.dart';

class ChatItem extends HookConsumerWidget {
  const ChatItem({super.key, required this.message});
  final MessageModel message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      if (ref.read(settingStateProvider.select((value) => value.autoRead))) {
        if (message.content != '_' && message.role == 'assistant') {
          ref.read(textToSpeechProvider).speak(message.content);
        }
      }
      return null;
    }, [message.content]);
    return Container(
      padding: const EdgeInsets.all(12.0),
      color: message.role == 'user'
          ? Theme.of(context).appBarTheme.backgroundColor
          : Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (message.role == 'user')
            const Icon(
              Icons.person,
              color: Colors.white,
            ),
          if (message.role == 'assistant')
            Image.network(
              'https://raw.githubusercontent.com/nvtphong200401/voicegpt/develop/assets/openai_logo.jpg',
              width: 20,
              height: 20,
            ),
          const SizedBox(
            width: 10,
          ),
          AnimationText(message: message.content),
          if (message.role == 'assistant')
            GestureDetector(
              onTap: () =>
                  ref.read(textToSpeechProvider).speak(message.content),
              child: const Icon(
                Icons.play_circle_fill_outlined,
                color: Colors.red,
              ),
            )
          // Expanded(
          //   child: Column(
          //     // crossAxisAlignment: CrossAxisAlignment.start,
          //     // mainAxisAlignment: MainAxisAlignment.start,
          //     children: content(),
          //   ),
          // )
        ],
      ),
    );
  }
}
