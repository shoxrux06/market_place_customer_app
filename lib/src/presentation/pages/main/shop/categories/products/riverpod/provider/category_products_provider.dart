import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../core/di/dependency_manager.dart';
import '../notifier/category_products_notifier.dart';
import '../state/category_products_state.dart';

final categoryProductsProvider = StateNotifierProvider.autoDispose<
    CategoryProductsNotifier, CategoryProductsState>(
  (ref) => CategoryProductsNotifier(productsRepository, brandsRepository),
);
