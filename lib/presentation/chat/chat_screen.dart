import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nvtphong200401_19127646_voicegpt/application/shared/providers.dart';
import 'package:nvtphong200401_19127646_voicegpt/core/constants.dart';
import 'package:nvtphong200401_19127646_voicegpt/presentation/chat/chat_item.dart';
import 'package:nvtphong200401_19127646_voicegpt/presentation/chat/setting_drawer.dart';
import 'package:nvtphong200401_19127646_voicegpt/service/shared/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'chat_input_bar.dart';

class ChatScreen extends HookConsumerWidget {
  const ChatScreen({super.key, required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [prefProvider.overrideWithValue(sharedPreferences)],
      child: Scaffold(
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
          ],
        ),
      ),
    );
  }
}
