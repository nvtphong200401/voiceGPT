import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voicegpt/application/shared/providers.dart';
import 'package:voicegpt/core/constants.dart';
import 'package:voicegpt/presentation/chat/chat_item.dart';
import 'package:voicegpt/presentation/chat/setting_drawer.dart';
import 'package:voicegpt/service/shared/providers.dart';

import 'chat_input_bar.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat GPT'),
        leading: Image.asset(appLogo),
        // actions: [
        //   Icon(Icons.menu)
        // ],
      ),
      endDrawer: const SettingDrawer(),
      body: Column(
        children: [
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final chatMessage = ref
                    .watch(chatNotifierProvider)
                    .state
                    .when(loading: (value) => value, data: (data) => data);
                return ListView.builder(
                  // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  controller: ref.watch(scrollProvider),
                  // childrenDelegate: SliverChildBuilderDelegate((context, index) {
                  //   return ChatItem(message: chatMessage[index]);
                  // }, childCount: chatMessage.length),
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
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
