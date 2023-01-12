import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/di/dependency_manager.dart';
import '../notifier/liked_notifier.dart';
import '../state/liked_state.dart';

final likedProvider = StateNotifierProvider<LikedNotifier, LikedState>(
  (ref) => LikedNotifier(
    productsRepository,
    categoriesRepository,
    brandsRepository,
  ),
);
