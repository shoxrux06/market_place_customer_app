import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/models.dart';
import '../../presentation/pages/main/profile/order_history/widgets/shop_logo_in_order_history_item.dart';
import '../../presentation/theme/app_colors.dart';
import '../constants/constants.dart';
import 'local_storage.dart';

class AppHelpers {
  AppHelpers._();

  static int getSubCategoriesLength(int? length) {
    if (length == null || length < 2) {
      return 0;
    }
    if (length > 5) {
      return 6;
    }
    if (length % 2 == 1) {
      return length - 1;
    }
    return length;
  }

  static showNoConnectionSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = SnackBar(
      backgroundColor: Colors.teal,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      content: Text(
        'No internet connection',
        style: GoogleFonts.k2d(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
      action: SnackBarAction(
        label: 'Close',
        disabledTextColor: Colors.white,
        textColor: Colors.yellow,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static bool isLikedProduct(int? id) {
    final List<int> likedProducts =
        LocalStorage.instance.getLikedProductsList();
    for (final likedId in likedProducts) {
      if (likedId == id) {
        return true;
      }
    }
    return false;
  }

  static ExtrasType getExtraTypeByValue(String? value) {
    switch (value) {
      case 'color':
        return ExtrasType.color;
      case 'text':
        return ExtrasType.text;
      case 'image':
        return ExtrasType.image;
      default:
        return ExtrasType.text;
    }
  }

  static OrderStatus getOrderStatus(String? value) {
    switch (value) {
      case 'new':
        return OrderStatus.newOrder;
      case 'accepted':
        return OrderStatus.accepted;
      case 'ready':
        return OrderStatus.ready;
      case 'on_a_way':
        return OrderStatus.onAWay;
      case 'delivered':
        return OrderStatus.delivered;
      default:
        return OrderStatus.newOrder;
    }
  }

  static String getOrderStatusText(String? value) {
    switch (value) {
      case 'new':
        return 'New';
      case 'accepted':
        return 'Accepted';
      case 'ready':
        return 'Ready';
      case 'on_a_way':
        return 'On a way';
      case 'delivered':
        return 'Delivered';
      default:
        return 'New';
    }
  }

  static IconData getOrderStatusIcon(String? value) {
    switch (value) {
      case 'new':
        return FlutterRemix.flag_fill;
      case 'accepted':
        return FlutterRemix.check_double_fill;
      case 'ready':
        return FlutterRemix.check_fill;
      case 'on_a_way':
        return FlutterRemix.e_bike_2_fill;
      case 'delivered':
        return FlutterRemix.flag_fill;
      default:
        return FlutterRemix.flag_fill;
    }
  }

  static int getOrderProductsCount(OrderData orderData) {
    int count = 0;
    final int orderDetailsCount = orderData.orderDetailsCount ?? 0;
    for (int i = 0; i < orderDetailsCount; i++) {
      count += orderData.details?[i].orderStocks?.length ?? 0;
    }
    return count;
  }

  static List<Widget> getOrderShopLogos(
    List<ShopOrderDetails>? shops,
  ) {
    List<Widget> widgets = [];
    final List<ShopOrderDetails> orderDetails = shops ?? [];
    int positioningLeft = 0;
    for (int i = 0; i < orderDetails.length; i++) {
      widgets.add(
        ShopLogoInOrderHistoryItem(
          positioningLeft: positioningLeft,
          imageUrl: orderDetails[i].shop?.logoImg,
        ),
      );
      positioningLeft += 25;
    }
    return widgets;
  }

  static String getShopName(
    int shopId,
    List<ShopData> shops,
  ) {
    for (final shop in shops) {
      if (shop.id == shopId) {
        return shop.translation?.title ?? '';
      }
    }
    return '';
  }

  static RichText getSearchResultText(
    String mainText,
    String subtext,
  ) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    if (!mainText.toUpperCase().contains(subtext.toUpperCase())) {
      return RichText(
        text: TextSpan(
          text: mainText,
          style: GoogleFonts.k2d(
            fontWeight: FontWeight.w500,
            fontSize: 13.sp,
            color: isDarkMode
                ? AppColors.white.withOpacity(0.26)
                : AppColors.black.withOpacity(0.2),
            letterSpacing: -14 * 0.01,
          ),
        ),
      );
    }
    final int startIndex =
        mainText.toUpperCase().indexOf(subtext.toUpperCase());
    final String prefixText = mainText.substring(0, startIndex);
    final String centerText =
        mainText.substring(startIndex, startIndex + subtext.length);
    final hasPostText = subtext.length + startIndex < mainText.length - 1;
    final String postText = hasPostText
        ? mainText.substring(subtext.length + startIndex, mainText.length - 1)
        : '';
    return RichText(
      text: TextSpan(
        text: prefixText,
        style: GoogleFonts.k2d(
          fontWeight: FontWeight.w500,
          fontSize: 13.sp,
          color: isDarkMode
              ? AppColors.white.withOpacity(0.26)
              : AppColors.black.withOpacity(0.2),
          letterSpacing: -14 * 0.01,
        ),
        children: <TextSpan>[
          TextSpan(
            text: centerText,
            style: GoogleFonts.k2d(
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
              color: isDarkMode ? AppColors.white : AppColors.black,
              letterSpacing: -14 * 0.01,
            ),
          ),
          TextSpan(
            text: postText,
            style: GoogleFonts.k2d(
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
              color: isDarkMode
                  ? AppColors.white.withOpacity(0.26)
                  : AppColors.black.withOpacity(0.2),
              letterSpacing: -14 * 0.01,
            ),
          ),
        ],
      ),
    );
  }

  static showCheckFlash(BuildContext context, String text) {
    return showFlash(
      context: context,
      duration: const Duration(seconds: 3),
      builder: (BuildContext context, FlashController controller) {
        return Flash(
          controller: controller,
          backgroundColor: AppColors.mainBack,
          position: FlashPosition.top,
          borderRadius: BorderRadius.circular(8.r),
          behavior: FlashBehavior.floating,
          margin: REdgeInsets.all(15),
          brightness: Brightness.light,
          barrierBlur: 1.5.r,
          barrierColor: Colors.black38,
          barrierDismissible: true,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColors.dontHaveAccBtnBack,
                width: 2.r,
              ),
            ),
            child: Padding(
              padding: REdgeInsets.all(15),
              child: Text(
                text,
                style: GoogleFonts.k2d(
                  color: AppColors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.4,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }

  static DateTime getMinTime(String openTime) {
    final int openHour = int.parse(openTime.substring(3, 5)) == 0
        ? int.parse(openTime.substring(0, 2))
        : int.parse(openTime.substring(0, 2)) + 1;
    final DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day, openHour);
  }

  static DateTime getMaxTime(String closeTime) {
    final int closeHour = int.parse(closeTime.substring(0, 2));
    final DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day, closeHour);
  }

  static double getOrderStatusProgress(String? status) {
    switch (status) {
      case 'new':
        return 0.2;
      case 'accepted':
        return 0.4;
      case 'ready':
        return 0.6;
      case 'on_a_way':
        return 0.8;
      case 'delivered':
        return 1;
      default:
        return 0.2;
    }
  }

  static String? getAppName() {
    final List<SettingsData> settings = LocalStorage.instance.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'title') {
        return setting.value;
      }
    }
    return 'GoShops';
  }

  static String getTranslation(String trKey) {
    final Map<String, dynamic> translations = LocalStorage.instance.getTranslations();
    for (final key in translations.keys) {
      if (trKey == key) {
        return translations[key];
      }
    }
    return trKey;
  }

  static double? getInitialLatitude() {
    final List<SettingsData> settings = LocalStorage.instance.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'location') {
        final String? latString =
            setting.value?.substring(0, setting.value?.indexOf(','));
        if (latString == null) {
          return null;
        }
        final double? lat = double.tryParse(latString);
        return lat;
      }
    }
    return null;
  }

  static double? getInitialLongitude() {
    final List<SettingsData> settings = LocalStorage.instance.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'location') {
        final String? latString =
            setting.value?.substring(0, setting.value?.indexOf(','));
        if (latString == null) {
          return null;
        }
        final String? lonString = setting.value
            ?.substring((latString.length) + 2, setting.value?.length);
        if (lonString == null) {
          return null;
        }
        final double lon = double.parse(lonString);
        return lon;
      }
    }
    return null;
  }

  static void showCustomModalBottomSheet({
    required BuildContext context,
    required Widget modal,
    required bool isDarkMode,
    int paddingTop = 200,
  }) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.r),
          topRight: Radius.circular(8.r),
        ),
      ),
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height - paddingTop.r,
      ),
      backgroundColor: isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
      context: context,
      builder: (context) => modal,
    );
  }

  static void showCustomModalBottomSheetVideo({
    required BuildContext context,
    required Widget modal,
    required bool isDarkMode,
    int paddingTop = 48,
  }) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.r),
          topRight: Radius.circular(8.r),
        ),
      ),
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height - paddingTop.r,
      ),
      backgroundColor:
      isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
      context: context,
      builder: (context) => modal,
    ).whenComplete(() => print('Dialog is cloased'));
  }
}
