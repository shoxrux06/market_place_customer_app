import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/di/dependency_manager.dart';
import '../notifier/notifications_notifier.dart';
import '../state/notifications_state.dart';

final notificationsProvider = StateNotifierProvider.autoDispose<
    NotificationsNotifier, NotificationsState>(
  (ref) => NotificationsNotifier(blogsRepository),
);
