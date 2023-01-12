import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/di/dependency_manager.dart';
import '../notifier/viewed_products_notifier.dart';
import '../state/viewed_products_state.dart';

final viewedProductsProvider = StateNotifierProvider.autoDispose<
    ViewedProductsNotifier, ViewedProductsState>(
  (ref) => ViewedProductsNotifier(
    productsRepository,
    categoriesRepository,
    brandsRepository,
  ),
);
