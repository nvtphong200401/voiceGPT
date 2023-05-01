import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../service/shared/providers.dart';
import '../chat_repo.dart';

final chatRepoProvider = Provider.autoDispose<ChatRepository>((ref) {
  return ChatRepository(ref.watch(chatServiceProvider));
});
