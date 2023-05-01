import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/constants.dart';
import 'voicegpt.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final pref = await SharedPreferences.getInstance();
  runApp(MyApp(
    sharedPreferences: pref,
  ));
}

class MyApp extends HookWidget {
  const MyApp({super.key, required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

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
          child: ChatScreen(
            sharedPreferences: sharedPreferences,
          ),
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        ),
      ),
    );
  }
}
