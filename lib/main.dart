import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voicegpt/application/shared/providers.dart';
import 'package:voicegpt/core/constants.dart';
import 'package:voicegpt/presentation/chat/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  runApp(ProviderScope(
    overrides: [prefProvider.overrideWithValue(pref)],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
