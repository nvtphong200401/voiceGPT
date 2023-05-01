import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/constants.dart';
import 'voicegpt.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends HookWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final appLifeCycleReactor = useMemoized(() {
    //   final AppOpenAdManager appOpenAdManager = AppOpenAdManager()..loadAd();
    //   return AppLifecycleReactor(appOpenAdManager: appOpenAdManager);
    // });
    // useEffect(() {
    //   appLifeCycleReactor.listenToAppStateChanges();
    //   return null;
    // }, [appLifeCycleReactor]);

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
