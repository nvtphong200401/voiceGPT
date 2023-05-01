import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../application/shared/providers.dart';
import '../../application/voice_notifier.dart';
import '../../core/constants.dart';
import '../../service/shared/providers.dart';
import 'voice_item.dart';

class ChatInputBar extends HookConsumerWidget {
  const ChatInputBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageController = useTextEditingController();

    final focusNode = useFocusNode();
    useEffect(() {
      final scrollController = ref.read(scrollProvider);
      onFoscus() {
        if (focusNode.hasFocus) {
          Future.delayed(const Duration(milliseconds: 300), () {
            log('scroll max');
            scrollController.animateTo(
                scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut);
          });
        }
      }

      focusNode.addListener(onFoscus);
      return () => focusNode.removeListener(onFoscus);
    }, [focusNode]);

    void onSendMessage() {
      if (messageController.text.isEmpty) return;
      ref
          .read(chatNotifierProvider.notifier)
          .sendMessage(messageController.text);
      messageController.clear();
    }

    ref.listen<VoiceState>(voiceNotifierProvider, (prev, next) {
      log('$prev - $next');
      next.when(stop: () {
        Future.delayed(const Duration(milliseconds: 200), onSendMessage);
      }, listening: (data) {
        messageController.text = data;
      });
    });

    return Material(
      color: cardColor,
      child: SizedBox(
        height: 50,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            // Expanded(
            // child:
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 60),
              child: Consumer(builder: (context, ref, child) {
                return TextFormField(
                  focusNode: focusNode,
                  enabled: ref
                      .watch(voiceNotifierProvider)
                      .when(stop: () => true, listening: (data) => false),
                  onFieldSubmitted: (value) {
                    onSendMessage.call();
                  },
                  controller: messageController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration.collapsed(
                    hintText: "How can I help you",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                );
              }),
            ),
            // ),
            Positioned(
              bottom: 0,
              top: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 7.5),
                child: VoiceItem(
                  messageController: messageController,
                  onSendMessage: onSendMessage,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
