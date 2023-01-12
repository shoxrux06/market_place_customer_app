import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../core/di/dependency_manager.dart';
import '../notifier/new_products_notifier.dart';
import '../state/new_products_state.dart';

final newProductsProvider =
    StateNotifierProvider.autoDispose<NewProductsNotifier, NewProductsState>(
  (ref) => NewProductsNotifier(
    brandsRepository,
    productsRepository,
    categoriesRepository,
  ),
);
