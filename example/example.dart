import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nvtphong200401_19127646_voicegpt/voicegpt.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  runApp(ProviderScope(
    child: MaterialApp(
      home: ChatScreen(
        sharedPreferences: pref,
      ),
    ),
  ));
}
