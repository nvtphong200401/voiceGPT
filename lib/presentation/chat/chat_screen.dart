import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nvtphong200401_19127646_voicegpt/application/shared/providers.dart';
import 'package:nvtphong200401_19127646_voicegpt/presentation/chat/chat_item.dart';
import 'package:nvtphong200401_19127646_voicegpt/presentation/chat/setting_drawer.dart';
import 'package:nvtphong200401_19127646_voicegpt/service/shared/providers.dart';

import '../../core/constants.dart';
import 'chat_input_bar.dart';

class ChatScreen extends HookConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        // cardColor,
        foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
        title: const Text('Chat GPT'),
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
                return Material(
                  color: scaffoldBackgroundColor,
                  child: ListView.builder(
                    // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    controller: ref.watch(scrollProvider),
                    // childrenDelegate: SliverChildBuilderDelegate((context, index) {
                    //   return ChatItem(message: chatMessage[index]);
                    // }, childCount: chatMessage.length),
                    itemBuilder: (context, index) => ChatItem(
                      message: chatMessage[index],
                    ),
                    itemCount: chatMessage.length,
                  ),
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
