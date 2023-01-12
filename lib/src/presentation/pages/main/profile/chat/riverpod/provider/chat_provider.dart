import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifier/chat_notifier.dart';
import '../state/chat_state.dart';

final chatProvider = StateNotifierProvider<ChatNotifier, ChatState>(
  (ref) => ChatNotifier(),
);
