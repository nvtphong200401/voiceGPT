import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voicegpt/application/shared/providers.dart';
import 'package:voicegpt/core/constants.dart';
import 'package:voicegpt/presentation/chat/chat_item.dart';
import 'package:voicegpt/service/shared/providers.dart';

import 'chat_input_bar.dart';

final countries = {'vi-VN': vietnamIcon, 'en-US': usIcon};

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(textToSpeechProvider, (prev, next) {});

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

class SettingDrawer extends StatelessWidget {
  const SettingDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            trailing: const SizedBox.shrink(),
            title: Consumer(builder: (context, ref, child) {
              return DropdownButton(
                isExpanded: true,
                alignment: Alignment.bottomCenter,
                icon: const SizedBox.shrink(),
                underline: const SizedBox.shrink(),
                value: ref.watch(settingStateProvider.select((value) => value.language)),
                items: countries.entries
                    .map((e) => DropdownMenuItem(
                          value: e.key,
                          child: Row(
                            children: [
                              Text(
                                e.key,
                                style: const TextStyle(color: Colors.black),
                              ),
                              const Spacer(),
                              Image.asset(
                                e.value,
                                width: 30,
                                height: 30,
                              ),
                            ],
                          ),
                        ))
                    .toList(),
                onChanged: (newValue) {
                  if (newValue != null) {
                    ref.read(settingStateProvider.notifier
                        .select((value) => value.state = value.state.copyWith(language: newValue)));
                  }
                },
              );
            }),
          ),
          Consumer(builder: (context, ref, child) {
            return ListTile(
              onTap: () {
                ref.read(settingStateProvider.notifier.select((value) =>
                    value.state = value.state.copyWith(autoRead: !value.state.autoRead)));
              },
              leading: const Text(
                'Auto read message',
                style: TextStyle(fontSize: 16),
              ),
              title: Switch(
                value: ref.watch(settingStateProvider.select((value) => value.autoRead)),
                onChanged: (newValue) {
                  ref.read(settingStateProvider.notifier.select((value) =>
                      value.state = value.state.copyWith(autoRead: !value.state.autoRead)));
                },
              ),
            );
          }),
          const ListTile(
            leading: Text(
              'Delete conversation',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
            title: Icon(
              CupertinoIcons.trash,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
