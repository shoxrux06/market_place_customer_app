import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.gr.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import 'riverpod/provider/saved_locations_provider.dart';
import 'widgets/saved_location_item.dart';

class SavedLocationsPage extends ConsumerStatefulWidget {
  const SavedLocationsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SavedLocationsPage> createState() => _SavedLocationsPageState();
}

class _SavedLocationsPageState extends ConsumerState<SavedLocationsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref.read(savedLocationsProvider.notifier).fetchSavedLocations();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(savedLocationsProvider);
    final notifier = ref.read(savedLocationsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: AbsorbPointer(
        absorbing: state.isLoading || state.isUpdating,
        child: Scaffold(
          extendBody: true,
          backgroundColor:
              isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
          appBar: CommonAppBar(
            title: AppHelpers.getTranslation(TrKeys.savedLocations),
            onLeadingPressed: context.popRoute,
          ),
          body: Column(
            children: [
              Container(
                color: isDarkMode
                    ? AppColors.white.withOpacity(0.5)
                    : AppColors.mainBack,
                height: 1.r,
              ),
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 15),
                      child: state.isLoading
                          ? const ProductHorizontalListShimmer(
                              height: 271,
                              spacing: 10,
                              verticalPadding: 31,
                            )
                          : ListView.builder(
                              physics: const CustomBouncingScrollPhysics(),
                              padding: REdgeInsets.only(top: 31, bottom: 82),
                              itemCount: state.addresses.length,
                              itemBuilder: (context, index) {
                                final address = state.addresses[index];
                                final markers = state.listOfMarkers[index];
                                return SavedLocationItem(
                                  address: address,
                                  markers: markers,
                                  onDelete: () =>
                                      notifier.deleteAddress(context, address),
                                );
                              },
                            ),
                    ),
                    BlurLoadingWidget(isLoading: state.isUpdating),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: REdgeInsets.only(left: 15, right: 15, bottom: 36),
            child: AccentLoginButton(
              title: AppHelpers.getTranslation(TrKeys.addLocation),
              onPressed: () =>
                  context.pushRoute(AddAddressRoute(isRequired: false)),
            ),
          ),
        ),
      ),
    );
  }
}
