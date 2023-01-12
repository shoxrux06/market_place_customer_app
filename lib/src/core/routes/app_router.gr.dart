// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/cupertino.dart' as _i4;
import 'package:flutter/material.dart' as _i3;

import '../../presentation/pages/pages.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
        transitionsBuilder: _i2.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NoConnectionRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.NoConnectionPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideTop,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SelectLanguageRoute.name: (routeData) {
      final args = routeData.argsAs<SelectLanguageRouteArgs>(
          orElse: () => const SelectLanguageRouteArgs());
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.SelectLanguagePage(
          key: args.key,
          isRequired: args.isRequired,
        ),
        transitionsBuilder: _i2.TransitionsBuilders.slideTop,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EnterPhoneRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.EnterPhonePage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.ResetPasswordPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ResetConfirmationRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.ResetConfirmationPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NewPasswordRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.NewPasswordPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RegisterConfirmationRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.RegisterConfirmationPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RegisterRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.RegisterPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    MainRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeftWithFade,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ShopMainRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.ShopMainPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.ProductPage(
          key: args.key,
          uuid: args.uuid,
        ),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BrandDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BrandDetailsRouteArgs>();
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.BrandDetailsPage(
          key: args.key,
          id: args.id,
        ),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BrandsRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.BrandsPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NotificationsRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.NotificationsPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AddAddressRoute.name: (routeData) {
      final args = routeData.argsAs<AddAddressRouteArgs>();
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.AddAddressPage(
          key: args.key,
          isRequired: args.isRequired,
        ),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SavedStoresRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.SavedStoresPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ViewedProductsRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.ViewedProductsPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SavedLocationsRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.SavedLocationsPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OrderRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.OrderPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CheckoutRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.CheckoutPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OrderHistoryRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.OrderHistoryPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CategoryProductsRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryProductsRouteArgs>(
          orElse: () => const CategoryProductsRouteArgs());
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.CategoryProductsPage(
          key: args.key,
          id: args.id,
          title: args.title,
        ),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileSettingsRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.ProfileSettingsPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OrderDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<OrderDetailsRouteArgs>();
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.OrderDetailsPage(
          key: args.key,
          orderId: args.orderId,
          date: args.date,
        ),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SystemSettingsRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.SystemSettingsPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BecomeSellerRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.BecomeSellerPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BlogRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.BlogPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BlogDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BlogDetailsRouteArgs>();
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.BlogDetailsPage(
          key: args.key,
          uuid: args.uuid,
          title: args.title,
        ),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NewProductsRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.NewProductsPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BannerDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BannerDetailsRouteArgs>(
          orElse: () => const BannerDetailsRouteArgs());
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.BannerDetailsPage(
          key: args.key,
          id: args.id,
          imageUrl: args.imageUrl,
        ),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    MostSoldProductsRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.MostSoldProductsPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DiscountProductsRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.DiscountProductsPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    WalletHistoriesRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.WalletHistoriesPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChatRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.ChatPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OftenBuyProductsRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.OftenBuyProductsPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfitableProductsRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.ProfitableProductsPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LooksRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.LooksPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ShopListRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.ShopListPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeftWithFade,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ViewMapRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.ViewMapPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeftWithFade,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SearchRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.SearchPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeftWithFade,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ShopDetailsRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.ShopDetailsPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CategoriesRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.CategoriesPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LikedRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.LikedPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i2.RouteConfig(
          NoConnectionRoute.name,
          path: '/no-connection',
        ),
        _i2.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i2.RouteConfig(
          SelectLanguageRoute.name,
          path: '/select-language',
        ),
        _i2.RouteConfig(
          EnterPhoneRoute.name,
          path: '/enter-phone',
        ),
        _i2.RouteConfig(
          ResetPasswordRoute.name,
          path: '/reset',
        ),
        _i2.RouteConfig(
          ResetConfirmationRoute.name,
          path: '/reset-confirmation',
        ),
        _i2.RouteConfig(
          NewPasswordRoute.name,
          path: '/new-password',
        ),
        _i2.RouteConfig(
          RegisterConfirmationRoute.name,
          path: '/register-confirmation',
        ),
        _i2.RouteConfig(
          RegisterRoute.name,
          path: '/register',
        ),
        _i2.RouteConfig(
          MainRoute.name,
          path: '/main',
          children: [
            _i2.RouteConfig(
              ShopListRoute.name,
              path: 'shop-list',
              parent: MainRoute.name,
            ),
            _i2.RouteConfig(
              ViewMapRoute.name,
              path: 'view-map',
              parent: MainRoute.name,
            ),
            _i2.RouteConfig(
              SearchRoute.name,
              path: 'search',
              parent: MainRoute.name,
            ),
          ],
        ),
        _i2.RouteConfig(
          ShopMainRoute.name,
          path: '/shop',
          children: [
            _i2.RouteConfig(
              ShopDetailsRoute.name,
              path: 'details',
              parent: ShopMainRoute.name,
            ),
            _i2.RouteConfig(
              CategoriesRoute.name,
              path: 'categories',
              parent: ShopMainRoute.name,
            ),
            _i2.RouteConfig(
              LikedRoute.name,
              path: 'liked',
              parent: ShopMainRoute.name,
            ),
          ],
        ),
        _i2.RouteConfig(
          ProductRoute.name,
          path: '/product',
        ),
        _i2.RouteConfig(
          BrandDetailsRoute.name,
          path: '/brand-details',
        ),
        _i2.RouteConfig(
          BrandsRoute.name,
          path: '/brands',
        ),
        _i2.RouteConfig(
          NotificationsRoute.name,
          path: '/notifications',
        ),
        _i2.RouteConfig(
          AddAddressRoute.name,
          path: '/add-address',
        ),
        _i2.RouteConfig(
          SavedStoresRoute.name,
          path: '/saved-stores',
        ),
        _i2.RouteConfig(
          ViewedProductsRoute.name,
          path: '/viewed-products',
        ),
        _i2.RouteConfig(
          SavedLocationsRoute.name,
          path: '/saved-locations',
        ),
        _i2.RouteConfig(
          OrderRoute.name,
          path: '/order',
        ),
        _i2.RouteConfig(
          CheckoutRoute.name,
          path: '/checkout',
        ),
        _i2.RouteConfig(
          OrderHistoryRoute.name,
          path: '/order-history',
        ),
        _i2.RouteConfig(
          CategoryProductsRoute.name,
          path: '/category-products',
        ),
        _i2.RouteConfig(
          ProfileSettingsRoute.name,
          path: '/profile-settings',
        ),
        _i2.RouteConfig(
          OrderDetailsRoute.name,
          path: '/order-details',
        ),
        _i2.RouteConfig(
          SystemSettingsRoute.name,
          path: '/system-settings',
        ),
        _i2.RouteConfig(
          BecomeSellerRoute.name,
          path: '/become-seller',
        ),
        _i2.RouteConfig(
          BlogRoute.name,
          path: '/blog',
        ),
        _i2.RouteConfig(
          BlogDetailsRoute.name,
          path: '/blog-details',
        ),
        _i2.RouteConfig(
          NewProductsRoute.name,
          path: '/new-products',
        ),
        _i2.RouteConfig(
          BannerDetailsRoute.name,
          path: '/banner-details',
        ),
        _i2.RouteConfig(
          MostSoldProductsRoute.name,
          path: '/most-sold',
        ),
        _i2.RouteConfig(
          DiscountProductsRoute.name,
          path: '/discount',
        ),
        _i2.RouteConfig(
          WalletHistoriesRoute.name,
          path: '/wallet-history',
        ),
        _i2.RouteConfig(
          ChatRoute.name,
          path: '/chat',
        ),
        _i2.RouteConfig(
          OftenBuyProductsRoute.name,
          path: '/often-buy',
        ),
        _i2.RouteConfig(
          ProfitableProductsRoute.name,
          path: '/profitable',
        ),
        _i2.RouteConfig(
          LooksRoute.name,
          path: '/looks',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i2.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i1.NoConnectionPage]
class NoConnectionRoute extends _i2.PageRouteInfo<void> {
  const NoConnectionRoute()
      : super(
          NoConnectionRoute.name,
          path: '/no-connection',
        );

  static const String name = 'NoConnectionRoute';
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i2.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i1.SelectLanguagePage]
class SelectLanguageRoute extends _i2.PageRouteInfo<SelectLanguageRouteArgs> {
  SelectLanguageRoute({
    _i4.Key? key,
    bool isRequired = false,
  }) : super(
          SelectLanguageRoute.name,
          path: '/select-language',
          args: SelectLanguageRouteArgs(
            key: key,
            isRequired: isRequired,
          ),
        );

  static const String name = 'SelectLanguageRoute';
}

class SelectLanguageRouteArgs {
  const SelectLanguageRouteArgs({
    this.key,
    this.isRequired = false,
  });

  final _i4.Key? key;

  final bool isRequired;

  @override
  String toString() {
    return 'SelectLanguageRouteArgs{key: $key, isRequired: $isRequired}';
  }
}

/// generated route for
/// [_i1.EnterPhonePage]
class EnterPhoneRoute extends _i2.PageRouteInfo<void> {
  const EnterPhoneRoute()
      : super(
          EnterPhoneRoute.name,
          path: '/enter-phone',
        );

  static const String name = 'EnterPhoneRoute';
}

/// generated route for
/// [_i1.ResetPasswordPage]
class ResetPasswordRoute extends _i2.PageRouteInfo<void> {
  const ResetPasswordRoute()
      : super(
          ResetPasswordRoute.name,
          path: '/reset',
        );

  static const String name = 'ResetPasswordRoute';
}

/// generated route for
/// [_i1.ResetConfirmationPage]
class ResetConfirmationRoute extends _i2.PageRouteInfo<void> {
  const ResetConfirmationRoute()
      : super(
          ResetConfirmationRoute.name,
          path: '/reset-confirmation',
        );

  static const String name = 'ResetConfirmationRoute';
}

/// generated route for
/// [_i1.NewPasswordPage]
class NewPasswordRoute extends _i2.PageRouteInfo<void> {
  const NewPasswordRoute()
      : super(
          NewPasswordRoute.name,
          path: '/new-password',
        );

  static const String name = 'NewPasswordRoute';
}

/// generated route for
/// [_i1.RegisterConfirmationPage]
class RegisterConfirmationRoute extends _i2.PageRouteInfo<void> {
  const RegisterConfirmationRoute()
      : super(
          RegisterConfirmationRoute.name,
          path: '/register-confirmation',
        );

  static const String name = 'RegisterConfirmationRoute';
}

/// generated route for
/// [_i1.RegisterPage]
class RegisterRoute extends _i2.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/register',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i2.PageRouteInfo<void> {
  const MainRoute({List<_i2.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/main',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i1.ShopMainPage]
class ShopMainRoute extends _i2.PageRouteInfo<void> {
  const ShopMainRoute({List<_i2.PageRouteInfo>? children})
      : super(
          ShopMainRoute.name,
          path: '/shop',
          initialChildren: children,
        );

  static const String name = 'ShopMainRoute';
}

/// generated route for
/// [_i1.ProductPage]
class ProductRoute extends _i2.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i4.Key? key,
    required String uuid,
  }) : super(
          ProductRoute.name,
          path: '/product',
          args: ProductRouteArgs(
            key: key,
            uuid: uuid,
          ),
        );

  static const String name = 'ProductRoute';
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.uuid,
  });

  final _i4.Key? key;

  final String uuid;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, uuid: $uuid}';
  }
}

/// generated route for
/// [_i1.BrandDetailsPage]
class BrandDetailsRoute extends _i2.PageRouteInfo<BrandDetailsRouteArgs> {
  BrandDetailsRoute({
    _i4.Key? key,
    required int id,
  }) : super(
          BrandDetailsRoute.name,
          path: '/brand-details',
          args: BrandDetailsRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'BrandDetailsRoute';
}

class BrandDetailsRouteArgs {
  const BrandDetailsRouteArgs({
    this.key,
    required this.id,
  });

  final _i4.Key? key;

  final int id;

  @override
  String toString() {
    return 'BrandDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i1.BrandsPage]
class BrandsRoute extends _i2.PageRouteInfo<void> {
  const BrandsRoute()
      : super(
          BrandsRoute.name,
          path: '/brands',
        );

  static const String name = 'BrandsRoute';
}

/// generated route for
/// [_i1.NotificationsPage]
class NotificationsRoute extends _i2.PageRouteInfo<void> {
  const NotificationsRoute()
      : super(
          NotificationsRoute.name,
          path: '/notifications',
        );

  static const String name = 'NotificationsRoute';
}

/// generated route for
/// [_i1.AddAddressPage]
class AddAddressRoute extends _i2.PageRouteInfo<AddAddressRouteArgs> {
  AddAddressRoute({
    _i4.Key? key,
    required bool isRequired,
  }) : super(
          AddAddressRoute.name,
          path: '/add-address',
          args: AddAddressRouteArgs(
            key: key,
            isRequired: isRequired,
          ),
        );

  static const String name = 'AddAddressRoute';
}

class AddAddressRouteArgs {
  const AddAddressRouteArgs({
    this.key,
    required this.isRequired,
  });

  final _i4.Key? key;

  final bool isRequired;

  @override
  String toString() {
    return 'AddAddressRouteArgs{key: $key, isRequired: $isRequired}';
  }
}

/// generated route for
/// [_i1.SavedStoresPage]
class SavedStoresRoute extends _i2.PageRouteInfo<void> {
  const SavedStoresRoute()
      : super(
          SavedStoresRoute.name,
          path: '/saved-stores',
        );

  static const String name = 'SavedStoresRoute';
}

/// generated route for
/// [_i1.ViewedProductsPage]
class ViewedProductsRoute extends _i2.PageRouteInfo<void> {
  const ViewedProductsRoute()
      : super(
          ViewedProductsRoute.name,
          path: '/viewed-products',
        );

  static const String name = 'ViewedProductsRoute';
}

/// generated route for
/// [_i1.SavedLocationsPage]
class SavedLocationsRoute extends _i2.PageRouteInfo<void> {
  const SavedLocationsRoute()
      : super(
          SavedLocationsRoute.name,
          path: '/saved-locations',
        );

  static const String name = 'SavedLocationsRoute';
}

/// generated route for
/// [_i1.OrderPage]
class OrderRoute extends _i2.PageRouteInfo<void> {
  const OrderRoute()
      : super(
          OrderRoute.name,
          path: '/order',
        );

  static const String name = 'OrderRoute';
}

/// generated route for
/// [_i1.CheckoutPage]
class CheckoutRoute extends _i2.PageRouteInfo<void> {
  const CheckoutRoute()
      : super(
          CheckoutRoute.name,
          path: '/checkout',
        );

  static const String name = 'CheckoutRoute';
}

/// generated route for
/// [_i1.OrderHistoryPage]
class OrderHistoryRoute extends _i2.PageRouteInfo<void> {
  const OrderHistoryRoute()
      : super(
          OrderHistoryRoute.name,
          path: '/order-history',
        );

  static const String name = 'OrderHistoryRoute';
}

/// generated route for
/// [_i1.CategoryProductsPage]
class CategoryProductsRoute
    extends _i2.PageRouteInfo<CategoryProductsRouteArgs> {
  CategoryProductsRoute({
    _i4.Key? key,
    int? id,
    String? title,
  }) : super(
          CategoryProductsRoute.name,
          path: '/category-products',
          args: CategoryProductsRouteArgs(
            key: key,
            id: id,
            title: title,
          ),
        );

  static const String name = 'CategoryProductsRoute';
}

class CategoryProductsRouteArgs {
  const CategoryProductsRouteArgs({
    this.key,
    this.id,
    this.title,
  });

  final _i4.Key? key;

  final int? id;

  final String? title;

  @override
  String toString() {
    return 'CategoryProductsRouteArgs{key: $key, id: $id, title: $title}';
  }
}

/// generated route for
/// [_i1.ProfileSettingsPage]
class ProfileSettingsRoute extends _i2.PageRouteInfo<void> {
  const ProfileSettingsRoute()
      : super(
          ProfileSettingsRoute.name,
          path: '/profile-settings',
        );

  static const String name = 'ProfileSettingsRoute';
}

/// generated route for
/// [_i1.OrderDetailsPage]
class OrderDetailsRoute extends _i2.PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({
    _i4.Key? key,
    required int orderId,
    required String date,
  }) : super(
          OrderDetailsRoute.name,
          path: '/order-details',
          args: OrderDetailsRouteArgs(
            key: key,
            orderId: orderId,
            date: date,
          ),
        );

  static const String name = 'OrderDetailsRoute';
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({
    this.key,
    required this.orderId,
    required this.date,
  });

  final _i4.Key? key;

  final int orderId;

  final String date;

  @override
  String toString() {
    return 'OrderDetailsRouteArgs{key: $key, orderId: $orderId, date: $date}';
  }
}

/// generated route for
/// [_i1.SystemSettingsPage]
class SystemSettingsRoute extends _i2.PageRouteInfo<void> {
  const SystemSettingsRoute()
      : super(
          SystemSettingsRoute.name,
          path: '/system-settings',
        );

  static const String name = 'SystemSettingsRoute';
}

/// generated route for
/// [_i1.BecomeSellerPage]
class BecomeSellerRoute extends _i2.PageRouteInfo<void> {
  const BecomeSellerRoute()
      : super(
          BecomeSellerRoute.name,
          path: '/become-seller',
        );

  static const String name = 'BecomeSellerRoute';
}

/// generated route for
/// [_i1.BlogPage]
class BlogRoute extends _i2.PageRouteInfo<void> {
  const BlogRoute()
      : super(
          BlogRoute.name,
          path: '/blog',
        );

  static const String name = 'BlogRoute';
}

/// generated route for
/// [_i1.BlogDetailsPage]
class BlogDetailsRoute extends _i2.PageRouteInfo<BlogDetailsRouteArgs> {
  BlogDetailsRoute({
    _i4.Key? key,
    required String uuid,
    required String title,
  }) : super(
          BlogDetailsRoute.name,
          path: '/blog-details',
          args: BlogDetailsRouteArgs(
            key: key,
            uuid: uuid,
            title: title,
          ),
        );

  static const String name = 'BlogDetailsRoute';
}

class BlogDetailsRouteArgs {
  const BlogDetailsRouteArgs({
    this.key,
    required this.uuid,
    required this.title,
  });

  final _i4.Key? key;

  final String uuid;

  final String title;

  @override
  String toString() {
    return 'BlogDetailsRouteArgs{key: $key, uuid: $uuid, title: $title}';
  }
}

/// generated route for
/// [_i1.NewProductsPage]
class NewProductsRoute extends _i2.PageRouteInfo<void> {
  const NewProductsRoute()
      : super(
          NewProductsRoute.name,
          path: '/new-products',
        );

  static const String name = 'NewProductsRoute';
}

/// generated route for
/// [_i1.BannerDetailsPage]
class BannerDetailsRoute extends _i2.PageRouteInfo<BannerDetailsRouteArgs> {
  BannerDetailsRoute({
    _i4.Key? key,
    int? id,
    String? imageUrl,
  }) : super(
          BannerDetailsRoute.name,
          path: '/banner-details',
          args: BannerDetailsRouteArgs(
            key: key,
            id: id,
            imageUrl: imageUrl,
          ),
        );

  static const String name = 'BannerDetailsRoute';
}

class BannerDetailsRouteArgs {
  const BannerDetailsRouteArgs({
    this.key,
    this.id,
    this.imageUrl,
  });

  final _i4.Key? key;

  final int? id;

  final String? imageUrl;

  @override
  String toString() {
    return 'BannerDetailsRouteArgs{key: $key, id: $id, imageUrl: $imageUrl}';
  }
}

/// generated route for
/// [_i1.MostSoldProductsPage]
class MostSoldProductsRoute extends _i2.PageRouteInfo<void> {
  const MostSoldProductsRoute()
      : super(
          MostSoldProductsRoute.name,
          path: '/most-sold',
        );

  static const String name = 'MostSoldProductsRoute';
}

/// generated route for
/// [_i1.DiscountProductsPage]
class DiscountProductsRoute extends _i2.PageRouteInfo<void> {
  const DiscountProductsRoute()
      : super(
          DiscountProductsRoute.name,
          path: '/discount',
        );

  static const String name = 'DiscountProductsRoute';
}

/// generated route for
/// [_i1.WalletHistoriesPage]
class WalletHistoriesRoute extends _i2.PageRouteInfo<void> {
  const WalletHistoriesRoute()
      : super(
          WalletHistoriesRoute.name,
          path: '/wallet-history',
        );

  static const String name = 'WalletHistoriesRoute';
}

/// generated route for
/// [_i1.ChatPage]
class ChatRoute extends _i2.PageRouteInfo<void> {
  const ChatRoute()
      : super(
          ChatRoute.name,
          path: '/chat',
        );

  static const String name = 'ChatRoute';
}

/// generated route for
/// [_i1.OftenBuyProductsPage]
class OftenBuyProductsRoute extends _i2.PageRouteInfo<void> {
  const OftenBuyProductsRoute()
      : super(
          OftenBuyProductsRoute.name,
          path: '/often-buy',
        );

  static const String name = 'OftenBuyProductsRoute';
}

/// generated route for
/// [_i1.ProfitableProductsPage]
class ProfitableProductsRoute extends _i2.PageRouteInfo<void> {
  const ProfitableProductsRoute()
      : super(
          ProfitableProductsRoute.name,
          path: '/profitable',
        );

  static const String name = 'ProfitableProductsRoute';
}

/// generated route for
/// [_i1.LooksPage]
class LooksRoute extends _i2.PageRouteInfo<void> {
  const LooksRoute()
      : super(
          LooksRoute.name,
          path: '/looks',
        );

  static const String name = 'LooksRoute';
}

/// generated route for
/// [_i1.ShopListPage]
class ShopListRoute extends _i2.PageRouteInfo<void> {
  const ShopListRoute()
      : super(
          ShopListRoute.name,
          path: 'shop-list',
        );

  static const String name = 'ShopListRoute';
}

/// generated route for
/// [_i1.ViewMapPage]
class ViewMapRoute extends _i2.PageRouteInfo<void> {
  const ViewMapRoute()
      : super(
          ViewMapRoute.name,
          path: 'view-map',
        );

  static const String name = 'ViewMapRoute';
}

/// generated route for
/// [_i1.SearchPage]
class SearchRoute extends _i2.PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: 'search',
        );

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i1.ShopDetailsPage]
class ShopDetailsRoute extends _i2.PageRouteInfo<void> {
  const ShopDetailsRoute()
      : super(
          ShopDetailsRoute.name,
          path: 'details',
        );

  static const String name = 'ShopDetailsRoute';
}

/// generated route for
/// [_i1.CategoriesPage]
class CategoriesRoute extends _i2.PageRouteInfo<void> {
  const CategoriesRoute()
      : super(
          CategoriesRoute.name,
          path: 'categories',
        );

  static const String name = 'CategoriesRoute';
}

/// generated route for
/// [_i1.LikedPage]
class LikedRoute extends _i2.PageRouteInfo<void> {
  const LikedRoute()
      : super(
          LikedRoute.name,
          path: 'liked',
        );

  static const String name = 'LikedRoute';
}
