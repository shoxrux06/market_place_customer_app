import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/di/dependency_manager.dart';
import '../notifier/shop_details_notifier.dart';
import '../state/shop_details_state.dart';

final shopDetailsProvider =
    StateNotifierProvider<ShopDetailsNotifier, ShopDetailsState>(
  (ref) => ShopDetailsNotifier(
    brandsRepository,
    productsRepository,
    categoriesRepository,
    bannersRepository,
  ),
);
