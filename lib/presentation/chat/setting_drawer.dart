import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/shared/providers.dart';
import '../../core/constants.dart';

class SettingDrawer extends ConsumerWidget {
  const SettingDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(textToSpeechProvider, (prev, next) {});
    ref.listen(settingStateProvider, (prev, next) {
      ref.read(prefProvider).write('settings', jsonEncode(next.toJson()));
    });
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
                value: ref.watch(
                    settingStateProvider.select((value) => value.language)),
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
                    ref.read(settingStateProvider.notifier.select((value) =>
                        value.state =
                            value.state.copyWith(language: newValue)));
                  }
                },
              );
            }),
          ),
          Consumer(builder: (context, ref, child) {
            return ListTile(
              onTap: () {
                ref.read(settingStateProvider.notifier.select((value) =>
                    value.state =
                        value.state.copyWith(autoRead: !value.state.autoRead)));
              },
              leading: const Text(
                'Auto read message',
                style: TextStyle(fontSize: 16),
              ),
              title: Switch(
                value: ref.watch(
                    settingStateProvider.select((value) => value.autoRead)),
                onChanged: (newValue) {
                  ref.read(settingStateProvider.notifier.select((value) => value
                          .state =
                      value.state.copyWith(autoRead: !value.state.autoRead)));
                },
              ),
            );
          }),
          ListTile(
            onTap: () => showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    icon: const Icon(
                      CupertinoIcons.trash,
                      color: Colors.red,
                    ),
                    title: const Text(
                        'The conversation will be clear and cannot reverse'),
                    actions: [
                      OutlinedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Cancel')),
                      OutlinedButton(
                          onPressed: () {
                            ref
                                .read(chatNotifierProvider.notifier)
                                .clearMessage();
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'OK',
                            style: TextStyle(color: Colors.red),
                          )),
                    ],
                  );
                }),
            leading: const Text(
              'Delete conversation',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
            title: const Icon(
              CupertinoIcons.trash,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
