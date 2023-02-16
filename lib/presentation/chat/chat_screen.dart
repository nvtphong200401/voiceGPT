import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voicegpt/presentation/chat/chat_item.dart';
import 'package:voicegpt/shared/providers.dart';

import 'chat_input_bar.dart';

class ChatScreen extends StatefulHookConsumerWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final chatMessage = ref.watch(chatMessageProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat GPT'),
        leading: Image.asset('assets/openai_logo.jpg'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => ChatItem(
                message: chatMessage[index],
              ),
              itemCount: chatMessage.length,
            ),
          ),
          const ChatInputBar(),
        ],
      ),
    );
  }
}
