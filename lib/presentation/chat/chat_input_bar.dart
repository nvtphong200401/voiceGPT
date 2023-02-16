import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../core/constants.dart';

class ChatInputBar extends HookConsumerWidget {
  const ChatInputBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageController = useTextEditingController();
    final bool emptyMessage = useListenableSelector(
        messageController, () => messageController.text.trim().isEmpty);

    void onSendMessage() {
      messageController.clear();
    }

    return Material(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
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
                      onTap: () {},
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 7.5),
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
