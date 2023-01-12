import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/di/dependency_manager.dart';
import '../notifier/shop_list_notifier.dart';
import '../state/shop_list_state.dart';

final shopListProvider = StateNotifierProvider<ShopListNotifier, ShopListState>(
  (ref) => ShopListNotifier(bannersRepository, categoriesRepository),
);
