import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/di/dependency_manager.dart';
import '../notifier/often_buy_products_notifier.dart';
import '../state/often_buy_products_state.dart';

final oftenBuyProductsProvider = StateNotifierProvider.autoDispose<
    OftenBuyProductsNotifier, OftenBuyProductsState>(
  (ref) => OftenBuyProductsNotifier(
    brandsRepository,
    productsRepository,
    categoriesRepository,
  ),
);
