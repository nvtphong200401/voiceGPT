import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voicegpt/application/shared/providers.dart';
import 'package:voicegpt/core/constants.dart';
import 'package:voicegpt/presentation/chat/chat_item.dart';
import 'package:voicegpt/presentation/chat/setting_drawer.dart';
import 'package:voicegpt/service/shared/providers.dart';

import '../../core/ad_manager.dart';
import 'chat_input_bar.dart';

class ChatScreen extends HookConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bannerAd = ref.watch(bannerAdProvider);

    useEffect(() {
      BannerAd(
        adUnitId: AdHelper.bannerAdUnitId,
        request: const AdRequest(),
        size: AdSize.banner,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            ref.read(bannerAdProvider.notifier).state = ad as BannerAd;
          },
          onAdFailedToLoad: (ad, err) {
            ad.dispose();
          },
        ),
      ).load();
      return null;
    }, []);
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
          if (bannerAd != null)
            SizedBox(
              width: bannerAd.size.width.toDouble(),
              height: bannerAd.size.height.toDouble(),
              child: AdWidget(ad: bannerAd),
            ),
        ],
      ),
    );
  }
}
