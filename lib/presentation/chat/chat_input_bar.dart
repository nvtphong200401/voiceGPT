import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:voicegpt/service/shared/providers.dart';

import '../../application/shared/providers.dart';
import '../../core/constants.dart';

class ChatInputBar extends HookConsumerWidget {
  const ChatInputBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageController = useTextEditingController();
    final bool emptyMessage =
        useListenableSelector(messageController, () => messageController.text.trim().isEmpty);

    void onSendMessage() {
      if (messageController.text.isEmpty) return;
      ref.read(chatNotifierProvider.notifier).sendMessage(messageController.text);
      messageController.clear();
    }

    final focusNode = useFocusNode();
    useEffect(() {
      final scrollController = ref.read(scrollProvider);
      onFoscus() {
        if (focusNode.hasFocus) {
          Future.delayed(const Duration(milliseconds: 300), () {
            log('scroll max');
            scrollController.animateTo(scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
          });
        }
      }

      focusNode.addListener(onFoscus);
      return () => focusNode.removeListener(onFoscus);
    }, [focusNode]);

    return Material(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                focusNode: focusNode,
                onFieldSubmitted: (value) {
                  onSendMessage.call();
                },
                controller: messageController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration.collapsed(
                  hintText: "How can I help you",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7.5),
              child: !emptyMessage
                  ? InkWell(
                      borderRadius: BorderRadius.circular(100.0),
                      onTap: onSendMessage,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 7.5),
                        child: Icon(
                          Icons.send_rounded,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : buildIcon(Icons.mic),
            )
          ],
        ),
      ),
    );
  }

  buildIcon(data) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 7.5),
        child: Icon(data, size: 20, color: Colors.white),
      );
}
