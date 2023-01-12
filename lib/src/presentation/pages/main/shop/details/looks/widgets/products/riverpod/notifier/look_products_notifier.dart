import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../../../core/constants/constants.dart';
import '../../../../../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../../../models/models.dart';
import '../../../../../../../../../../repository/repository.dart';
import '../state/look_products_state.dart';

class LookProductsNotifier extends StateNotifier<LookProductsState> {
  final BannersRepository _bannersRepository;

  LookProductsNotifier(this._bannersRepository)
      : super(const LookProductsState());

  Future<void> fetchBannerProducts(BuildContext context, int? id) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(
        isLoading: true,
        products: [],
      );
      final response = await _bannersRepository.getBannerProducts(id);
      response.when(
        success: (data) {
          final List<ProductData> products = data.data ?? [];
          List<List<Stocks>> listOfInitialStocks = [];
          for (int i = 0; i < products.length; i++) {
            final List<Stocks> stocks = products[i].stocks ?? <Stocks>[];
            listOfInitialStocks.add(stocks);
          }
          state = state.copyWith(
            products: products,
            listOfInitialStocks: listOfInitialStocks,
            isLoading: false,
            listOfTypedExtras: List.filled(listOfInitialStocks.length, []),
            listOfSelectedStocks: List.filled(listOfInitialStocks.length, null),
            productsAddedToCart: List.filled(
              listOfInitialStocks.length,
              LookProductStockStatus.notAdded,
            ),
          );
          List<List<int>> listOfSelectedIndexes = [];
          for (int i = 0; i < products.length; i++) {
            if (state.listOfInitialStocks[i].isNotEmpty) {
              final int groupsCount =
                  listOfInitialStocks[i][0].extras?.length ?? 0;
              final List<int> selectedIndexes = List.filled(groupsCount, 0);
              listOfSelectedIndexes.add(selectedIndexes);
            } else {
              listOfSelectedIndexes.add([]);
            }
          }
          for (int i = 0; i < products.length; i++) {
            initialSetSelectedIndexes(
              context,
              listOfSelectedIndexes,
              productIndex: i,
            );
          }
        },
        failure: (failure) {
          state = state.copyWith(isLoading: false);
          debugPrint('==> get look products failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  void updateSelectedIndexes(
    BuildContext context, {
    required int index,
    required int value,
    required int productIndex,
  }) {
    final newList = state.listOfSelectedIndexes[productIndex].sublist(0, index);
    newList.add(value);
    final postList = List.filled(
        state.listOfSelectedIndexes[productIndex].length - newList.length, 0);
    newList.addAll(postList);
    List<List<int>> selectedIndexes = List.from(state.listOfSelectedIndexes);
    selectedIndexes[productIndex] = newList;
    initialSetSelectedIndexes(
      context,
      selectedIndexes,
      productIndex: productIndex,
    );
  }

  void initialSetSelectedIndexes(
    BuildContext context,
    List<List<int>> indexes, {
    required int productIndex,
  }) {
    state = state.copyWith(listOfSelectedIndexes: indexes);
    updateExtras(context, productIndex: productIndex);
  }

  void updateExtras(
    BuildContext context, {
    required int productIndex,
  }) {
    final int groupsCount =
        state.listOfInitialStocks[productIndex][0].extras?.length ?? 0;
    final List<TypedExtra> groupExtras = [];
    for (int i = 0; i < groupsCount; i++) {
      if (i == 0) {
        final TypedExtra extras = getFirstExtras(
          selectedIndex: state.listOfSelectedIndexes[productIndex][0],
          productIndex: productIndex,
        );
        groupExtras.add(extras);
      } else {
        final TypedExtra extras =
            getUniqueExtras(groupExtras, productIndex: productIndex, index: i);
        groupExtras.add(extras);
      }
    }
    final Stocks? selectedStock =
        getSelectedStock(groupExtras, productIndex: productIndex);
    List<List<TypedExtra>> typedExtras = List.from(state.listOfTypedExtras);
    List<Stocks?> selectedStocks = List.from(state.listOfSelectedStocks);
    List<LookProductStockStatus> addedToCart =
        List.from(state.productsAddedToCart);
    final List<CartProductData> cartProducts =
        LocalStorage.instance.getCartProducts();
    typedExtras[productIndex] = groupExtras;
    if (selectedStock != null) {
      selectedStocks[productIndex] = selectedStock;
      if ((selectedStock.quantity ?? 0) >=
          (selectedStock.product?.minQty ?? 1)) {
        addedToCart[productIndex] = LookProductStockStatus.notAdded;
      } else {
        addedToCart[productIndex] = LookProductStockStatus.outOfStock;
      }
      for (final product in cartProducts) {
        if (product.selectedStock?.id == selectedStock.id) {
          addedToCart[productIndex] = LookProductStockStatus.alreadyAdded;
          break;
        }
      }
    }
    state = state.copyWith(
      listOfTypedExtras: typedExtras,
      listOfSelectedStocks: selectedStocks,
      productsAddedToCart: addedToCart,
    );
  }

  Stocks? getSelectedStock(
    List<TypedExtra> groupExtras, {
    required int productIndex,
  }) {
    List<Stocks> stocks = List.from(state.listOfInitialStocks[productIndex]);
    for (int i = 0; i < groupExtras.length; i++) {
      String selectedExtrasValue = groupExtras[i]
          .uiExtras[state.listOfSelectedIndexes[productIndex][i]]
          .value;
      stocks = getSelectedStocks(stocks, selectedExtrasValue, i);
    }
    return stocks[0];
  }

  List<Stocks> getSelectedStocks(List<Stocks> stocks, String value, int index) {
    List<Stocks> included = [];
    for (int i = 0; i < stocks.length; i++) {
      if (stocks[i].extras?[index].value == value) {
        included.add(stocks[i]);
      }
    }
    return included;
  }

  TypedExtra getFirstExtras({
    required int selectedIndex,
    required int productIndex,
  }) {
    ExtrasType type = ExtrasType.text;
    String title = '';
    final List<String> uniques = [];
    for (int i = 0; i < state.listOfInitialStocks[productIndex].length; i++) {
      uniques.add(
          state.listOfInitialStocks[productIndex][i].extras?[0].value ?? '');
      title = state.listOfInitialStocks[productIndex][i].extras?[0].group
              ?.translation?.title ??
          '';
      type = AppHelpers.getExtraTypeByValue(
        state.listOfInitialStocks[productIndex][i].extras?[0].group?.type,
      );
    }
    final setOfUniques = uniques.toSet().toList();
    final List<UiExtra> extras = [];
    for (int i = 0; i < setOfUniques.length; i++) {
      if (selectedIndex == i) {
        extras.add(UiExtra(setOfUniques[i], true, i));
      } else {
        extras.add(UiExtra(setOfUniques[i], false, i));
      }
    }
    return TypedExtra(type, extras, title, 0);
  }

  TypedExtra getUniqueExtras(
    List<TypedExtra> groupExtras, {
    required int productIndex,
    required int index,
  }) {
    List<Stocks> includedStocks =
        List.from(state.listOfInitialStocks[productIndex]);
    for (int i = 0; i < groupExtras.length; i++) {
      final String includedValue = groupExtras[i]
          .uiExtras[state.listOfSelectedIndexes[productIndex][i]]
          .value;
      includedStocks = getIncludedStocks(includedStocks, i, includedValue);
    }
    final List<String> uniques = [];
    String title = '';
    ExtrasType type = ExtrasType.text;
    for (int i = 0; i < includedStocks.length; i++) {
      uniques.add(includedStocks[i].extras?[index].value ?? '');
      title = includedStocks[i].extras?[index].group?.translation?.title ?? '';
      type = AppHelpers.getExtraTypeByValue(
          includedStocks[i].extras?[index].group?.type ?? '');
    }
    final setOfUniques = uniques.toSet().toList();
    final List<UiExtra> extras = [];
    for (int i = 0; i < setOfUniques.length; i++) {
      if (state.listOfSelectedIndexes[productIndex][groupExtras.length] == i) {
        extras.add(UiExtra(setOfUniques[i], true, i));
      } else {
        extras.add(UiExtra(setOfUniques[i], false, i));
      }
    }
    return TypedExtra(type, extras, title, index);
  }

  List<Stocks> getIncludedStocks(
    List<Stocks> includedStocks,
    int index,
    String includedValue,
  ) {
    List<Stocks> stocks = [];
    for (int i = 0; i < includedStocks.length; i++) {
      if (includedStocks[i].extras?[index].value == includedValue) {
        stocks.add(includedStocks[i]);
      }
    }
    return stocks;
  }

  void addProductToCart(int productIndex) {
    final List<CartProductData> cartProducts =
        LocalStorage.instance.getCartProducts();
    final int minQty =
        state.listOfSelectedStocks[productIndex]?.product?.minQty ?? 0;
    final int stockQty =
        state.listOfSelectedStocks[productIndex]?.quantity ?? 0;
    cartProducts.insert(
      0,
      CartProductData(
        selectedStock: state.listOfSelectedStocks[productIndex],
        quantity: stockQty < minQty ? stockQty : minQty,
        imageUrl: state.products[productIndex].img,
        title: state.products[productIndex].translation?.title,
      ),
    );
    LocalStorage.instance.setCartProducts(cartProducts);
    List<LookProductStockStatus> addedToCart =
        List.from(state.productsAddedToCart);
    addedToCart[productIndex] = LookProductStockStatus.alreadyAdded;
    state = state.copyWith(productsAddedToCart: addedToCart);
  }

  void deleteProductFromCart(int productIndex) {
    final List<CartProductData> cartProducts =
        LocalStorage.instance.getCartProducts();
    int addedIndex = 0;
    for (int i = 0; i < cartProducts.length; i++) {
      if (cartProducts[i].selectedStock?.product?.id ==
              state.products[productIndex].id &&
          cartProducts[i].selectedStock?.id ==
              state.listOfSelectedStocks[productIndex]?.id) {
        addedIndex = i;
        break;
      }
    }
    cartProducts.removeAt(addedIndex);
    LocalStorage.instance.setCartProducts(cartProducts);
    List<LookProductStockStatus> addedToCart =
        List.from(state.productsAddedToCart);
    addedToCart[productIndex] = LookProductStockStatus.notAdded;
    state = state.copyWith(productsAddedToCart: addedToCart);
  }

  void buyAllProducts(BuildContext context) {
    bool canBuyAll = true;
    int indexOfOutOfStockProduct = 0;
    for (int i = 0; i < state.listOfSelectedStocks.length; i++) {
      final int minQty = state.listOfSelectedStocks[i]?.product?.minQty ?? 1;
      final int qty = state.listOfSelectedStocks[i]?.quantity ?? 0;
      if (qty < minQty) {
        canBuyAll = false;
        indexOfOutOfStockProduct = i;
        break;
      }
    }
    if (!canBuyAll) {
      AppHelpers.showCheckFlash(
        context,
        '${state.products[indexOfOutOfStockProduct].translation?.title} ${AppHelpers.getTranslation(TrKeys.outOfStock).toLowerCase()}',
      );
      return;
    }
    final List<CartProductData> cartProducts =
        LocalStorage.instance.getCartProducts();
    int productIndex = -1;
    for (final stock in state.listOfSelectedStocks) {
      productIndex++;
      final int minQty = stock?.product?.minQty ?? 1;
      final int qty = stock?.quantity ?? 0;
      if (qty >= minQty) {
        bool alreadyAdded = false;
        for (final cartProduct in cartProducts) {
          if (stock?.product?.id == cartProduct.selectedStock?.product?.id &&
              stock?.id == cartProduct.selectedStock?.id) {
            alreadyAdded = true;
            break;
          }
        }
        if (!alreadyAdded) {
          final int minQty =
              state.listOfSelectedStocks[productIndex]?.product?.minQty ?? 0;
          final int stockQty =
              state.listOfSelectedStocks[productIndex]?.quantity ?? 0;
          cartProducts.insert(
            0,
            CartProductData(
              selectedStock: state.listOfSelectedStocks[productIndex],
              quantity: stockQty < minQty ? stockQty : minQty,
              imageUrl: state.products[productIndex].img,
              title: state.products[productIndex].translation?.title,
            ),
          );
          LocalStorage.instance.setCartProducts(cartProducts);
          List<LookProductStockStatus> addedToCart =
              List.from(state.productsAddedToCart);
          addedToCart[productIndex] = LookProductStockStatus.alreadyAdded;
          state = state.copyWith(productsAddedToCart: addedToCart);
        }
      }
    }
    context.pushRoute(const OrderRoute());
  }
}
