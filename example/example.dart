import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nvtphong200401_19127646_voicegpt/voicegpt.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetStorage.init();
  runApp(const ProviderScope(
    child: MaterialApp(
      home: ChatScreen(),
    ),
  ));
}
