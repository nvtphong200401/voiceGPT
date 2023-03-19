import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voicegpt/application/shared/providers.dart';
import 'package:voicegpt/core/constants.dart';
import 'package:voicegpt/presentation/chat/chat_item.dart';

import 'chat_input_bar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat GPT'),
        leading: Image.asset(appLogo),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final chatMessage = ref
                    .watch(chatNotifierProvider)
                    .when(loading: (value) => value, data: (data) => data);
                return ListView.builder(
                  itemBuilder: (context, index) => ChatItem(
                    message: chatMessage[index],
                  ),
                  itemCount: chatMessage.length,
                );
              },
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          const ChatInputBar(),
        ],
      ),
    );
  }
}
