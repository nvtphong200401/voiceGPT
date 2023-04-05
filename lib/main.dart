import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voicegpt/application/shared/providers.dart';
import 'package:voicegpt/core/ad_manager.dart';
import 'package:voicegpt/core/constants.dart';
import 'package:voicegpt/presentation/chat/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  final pref = await SharedPreferences.getInstance();
  runApp(ProviderScope(
    overrides: [prefProvider.overrideWithValue(pref)],
    child: const MyApp(),
  ));
}

class MyApp extends HookWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appLifeCycleReactor = useMemoized(() {
      final AppOpenAdManager appOpenAdManager = AppOpenAdManager()..loadAd();
      return AppLifecycleReactor(appOpenAdManager: appOpenAdManager);
    });
    useEffect(() {
      appLifeCycleReactor.listenToAppStateChanges();
      return null;
    }, [appLifeCycleReactor]);

    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            scaffoldBackgroundColor: scaffoldBackgroundColor,
            appBarTheme: AppBarTheme(color: cardColor)),
        home: GestureDetector(
          child: const ChatScreen(),
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        ),
      ),
    );
  }
}
