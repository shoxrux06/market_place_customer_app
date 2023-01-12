import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/di/dependency_manager.dart';
import '../notifier/blogs_notifier.dart';
import '../state/blogs_state.dart';

final blogsProvider =
    StateNotifierProvider.autoDispose<BlogsNotifier, BlogsState>(
  (ref) => BlogsNotifier(blogsRepository),
);
