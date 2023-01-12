import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../core/di/dependency_manager.dart';
import '../notifier/most_sold_products_notifier.dart';
import '../state/most_sold_products_state.dart';

final mostSoldProductsProvider = StateNotifierProvider.autoDispose<
    MostSoldProductsNotifier, MostSoldProductsState>(
  (ref) => MostSoldProductsNotifier(
    brandsRepository,
    productsRepository,
    categoriesRepository,
  ),
);
