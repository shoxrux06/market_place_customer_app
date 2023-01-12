import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../core/di/dependency_manager.dart';
import '../notifier/blog_details_notifier.dart';
import '../state/blog_details_state.dart';

final blogDetailsProvider =
    StateNotifierProvider.autoDispose<BlogDetailsNotifier, BlogDetailsState>(
  (ref) => BlogDetailsNotifier(blogsRepository),
);
