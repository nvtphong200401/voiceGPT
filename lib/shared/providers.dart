import 'package:hooks_riverpod/hooks_riverpod.dart';

final chatMessageProvider = StateProvider<List<String>>((ref) {
  return [];
});
