import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../core/di/dependency_manager.dart';
import '../notifier/banner_details_notifier.dart';
import '../state/banner_details_state.dart';

final bannerDetailsProvider = StateNotifierProvider.autoDispose<
    BannerDetailsNotifier, BannerDetailsState>(
  (ref) => BannerDetailsNotifier(
    bannersRepository,
    brandsRepository,
    productsRepository,
    categoriesRepository,
  ),
);
