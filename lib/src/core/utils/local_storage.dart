import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/models.dart';
import '../constants/constants.dart';

class LocalStorage {
  static SharedPreferences? _preferences;

  LocalStorage._();

  static LocalStorage? _localStorage;

  static LocalStorage instance = LocalStorage._();

  static Future<LocalStorage> getInstance() async {
    if (_localStorage == null) {
      _localStorage = LocalStorage._();
      await _localStorage!._init();
    }
    return _localStorage!;
  }

  static Future<SharedPreferences> getSharedPreferences() async {
    if (_preferences == null) {
      _localStorage = LocalStorage._();
      await _localStorage!._init();
    }
    return _preferences!;
  }

  Future<void> _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setLangSelected(bool selected) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyLangSelected, selected);
    }
  }

  bool getLangSelected() =>
      _preferences?.getBool(AppConstants.keyLangSelected) ?? false;

  Future<void> setUser(UserData? user) async {
    if (_preferences != null) {
      final String userString = user != null ? jsonEncode(user.toJson()) : '';
      await _preferences!.setString(AppConstants.keyUser, userString);
    }
  }

  UserData? getUser() {
    final savedString = _preferences?.getString(AppConstants.keyUser);
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return UserData.fromJson(map);
  }

  void deleteUser() => _preferences?.remove(AppConstants.keyUser);

  Future<void> setToken(String? token) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyToken, token ?? '');
    }
  }

  String getToken() => _preferences?.getString(AppConstants.keyToken) ?? '';

  void deleteToken() => _preferences?.remove(AppConstants.keyToken);

  Future<void> setCardToken(String? token) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.cardToken, token ?? '');
    }
  }

  String getCardToken() => _preferences?.getString(AppConstants.cardToken) ?? '';

  void deleteCardToken() => _preferences?.remove(AppConstants.cardToken);

  Future<void> setFirstName(String? name) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyFirstName, name ?? '');
    }
  }

  String getFirstName() => _preferences?.getString(AppConstants.keyFirstName) ?? '';

  void deleteFirstName() => _preferences?.remove(AppConstants.keyFirstName);

  Future<void> setLastName(String? name) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyLastName, name ?? '');
    }
  }

  String getLastName() =>
      _preferences?.getString(AppConstants.keyLastName) ?? '';

  void deleteLastName() => _preferences?.remove(AppConstants.keyLastName);

  Future<void> setProfileImage(String? image) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyProfileImage, image ?? '');
    }
  }

  String getProfileImage() =>
      _preferences?.getString(AppConstants.keyProfileImage) ?? '';

  void deleteProfileImage() =>
      _preferences?.remove(AppConstants.keyProfileImage);

  Future<void> setSavedShopsList(List<int> ids) async {
    if (_preferences != null) {
      final List<String> idsStrings = ids.map((e) => e.toString()).toList();
      await _preferences!
          .setStringList(AppConstants.keySavedStores, idsStrings);
    }
  }

  List<int> getSavedShopsList() {
    final List<String> strings =
        _preferences?.getStringList(AppConstants.keySavedStores) ?? [];
    final List<int> ids = strings.map((e) => int.parse(e)).toList();
    return ids;
  }

  void deleteSavedShopsList() =>
      _preferences?.remove(AppConstants.keySavedStores);

  Future<void> setViewedProductsList(List<int> ids) async {
    if (_preferences != null) {
      final List<String> idsStrings = ids.map((e) => e.toString()).toList();
      await _preferences!
          .setStringList(AppConstants.keyViewedProducts, idsStrings);
    }
  }

  List<int> getViewedProductsList() {
    final List<String> stringIds =
        _preferences?.getStringList(AppConstants.keyViewedProducts) ?? [];
    final List<int> ids = stringIds.map((e) => int.parse(e)).toList();
    return ids;
  }

  void deleteViewedProductsList() =>
      _preferences?.remove(AppConstants.keyViewedProducts);

  Future<void> setAddressSelected(bool selected) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyAddressSelected, selected);
    }
  }

  bool getAddressSelected() =>
      _preferences?.getBool(AppConstants.keyAddressSelected) ?? false;

  void deleteAddressSelected() =>
      _preferences?.remove(AppConstants.keyAddressSelected);

  Future<void> setLanguageSelected(bool selected) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyLangSelected, selected);
    }
  }

  bool getLanguageSelected() =>
      _preferences?.getBool(AppConstants.keyLangSelected) ?? false;

  void deleteLangSelected() =>
      _preferences?.remove(AppConstants.keyLangSelected);

  Future<void> setIsGuest(bool guest) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyIsGuest, guest);
    }
  }

  bool getIsGuest() => _preferences?.getBool(AppConstants.keyIsGuest) ?? false;

  void deleteIsGuest() => _preferences?.remove(AppConstants.keyIsGuest);

  Future<void> setLocalAddressesList(List<LocalAddressData> addresses) async {
    if (_preferences != null) {
      final List<String> newList =
          addresses.map((address) => jsonEncode(address.toJson())).toList();
      await _preferences!
          .setStringList(AppConstants.keyLocalAddresses, newList);
    }
  }

  List<LocalAddressData> getLocalAddressesList() {
    final List<String> addresses =
        _preferences?.getStringList(AppConstants.keyLocalAddresses) ?? [];
    final List<LocalAddressData> localAddresses = addresses
        .map(
          (address) => LocalAddressData.fromJson(jsonDecode(address)),
        )
        .toList();
    return localAddresses;
  }

  void deleteLocalAddressesList() =>
      _preferences?.remove(AppConstants.keyLocalAddresses);

  Future<void> setActiveAddressTile(String title) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyActiveAddressTitle, title);
    }
  }

  String getActiveAddressTitle() =>
      _preferences?.getString(AppConstants.keyActiveAddressTitle) ?? '';

  void deleteActiveAddressTile() =>
      _preferences?.remove(AppConstants.keyActiveAddressTitle);

  Future<void> setSelectedCurrency(CurrencyData currency) async {
    if (_preferences != null) {
      final String currencyString = jsonEncode(currency.toJson());
      await _preferences!
          .setString(AppConstants.keySelectedCurrency, currencyString);
    }
  }

  CurrencyData getSelectedCurrency() {
    final map = jsonDecode(
        _preferences?.getString(AppConstants.keySelectedCurrency) ?? '');
    return CurrencyData.fromJson(map);
  }

  void deleteSelectedCurrency() =>
      _preferences?.remove(AppConstants.keySelectedCurrency);

  Future<void> setWalletData(Wallet? wallet) async {
    if (_preferences != null) {
      final String walletString = jsonEncode(wallet?.toJson());
      await _preferences!.setString(AppConstants.keyWalletData, walletString);
    }
  }

  Wallet? getWalletData() {
    final wallet = _preferences?.getString(AppConstants.keyWalletData);
    if (wallet == null) {
      return null;
    }
    final map = jsonDecode(wallet);
    if (map == null) {
      return null;
    }
    return Wallet.fromJson(map);
  }

  void deleteWalletData() => _preferences?.remove(AppConstants.keyWalletData);

  Future<void> setLikedProductsList(List<int> ids) async {
    if (_preferences != null) {
      final List<String> stringList = ids.map((id) => id.toString()).toList();
      await _preferences!
          .setStringList(AppConstants.keyLikedProducts, stringList);
    }
  }

  List<int> getLikedProductsList() {
    final List<String> idsStrings =
        _preferences?.getStringList(AppConstants.keyLikedProducts) ?? [];
    final List<int> ids = idsStrings.map((id) => int.parse(id)).toList();
    return ids;
  }

  void deleteLikedProductsList() =>
      _preferences?.remove(AppConstants.keyLikedProducts);

  Future<void> setCartProducts(List<CartProductData> products) async {
    if (_preferences != null) {
      final List<String> strings =
          products.map((product) => jsonEncode(product.toJson())).toList();
      await _preferences!.setStringList(AppConstants.keyCartProducts, strings);
    }
  }

  List<CartProductData> getCartProducts() {
    final List<String> products =
        _preferences?.getStringList(AppConstants.keyCartProducts) ?? [];
    final List<CartProductData> cartProducts = products
        .map(
          (product) => CartProductData.fromJson(jsonDecode(product)),
        )
        .toList();
    return cartProducts;
  }

  void deleteCartProducts() =>
      _preferences?.remove(AppConstants.keyCartProducts);

  Future<void> setSettingsList(List<SettingsData> settings) async {
    if (_preferences != null) {
      final List<String> strings =
          settings.map((setting) => jsonEncode(setting.toJson())).toList();
      await _preferences!
          .setStringList(AppConstants.keyGlobalSettings, strings);
    }
  }

  List<SettingsData> getSettingsList() {
    final List<String> settings =
        _preferences?.getStringList(AppConstants.keyGlobalSettings) ?? [];
    final List<SettingsData> settingsList = settings
        .map(
          (setting) => SettingsData.fromJson(jsonDecode(setting)),
        )
        .toList();
    return settingsList;
  }

  void deleteSettingsList() =>
      _preferences?.remove(AppConstants.keyGlobalSettings);

  Future<void> setTranslations(Map<String, dynamic>? translations) async {
    if (_preferences != null) {
      final String encoded = jsonEncode(translations);
      await _preferences!.setString(AppConstants.keyTranslations, encoded);
    }
  }

  Map<String, dynamic> getTranslations() {
    final String encoded =
        _preferences?.getString(AppConstants.keyTranslations) ?? '';
    if (encoded.isEmpty) {
      return {};
    }
    final Map<String, dynamic> decoded = jsonDecode(encoded);
    return decoded;
  }

  void deleteTranslations() =>
      _preferences?.remove(AppConstants.keyTranslations);

  Future<void> setAppThemeMode(bool isDarkMode) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyAppThemeMode, isDarkMode);
    }
  }

  bool getAppThemeMode() =>
      _preferences?.getBool(AppConstants.keyAppThemeMode) ?? false;

  void deleteAppThemeMode() =>
      _preferences?.remove(AppConstants.keyAppThemeMode);

  Future<void> setSettingsFetched(bool fetched) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keySettingsFetched, fetched);
    }
  }

  bool getSettingsFetched() =>
      _preferences?.getBool(AppConstants.keySettingsFetched) ?? false;

  void deleteSettingsFetched() =>
      _preferences?.remove(AppConstants.keySettingsFetched);

  Future<void> setLanguageData(LanguageData? langData) async {
    if (_preferences != null) {
      final String lang = jsonEncode(langData?.toJson());
      await _preferences!.setString(AppConstants.keyLanguageData, lang);
    }
  }

  LanguageData? getLanguage() {
    final lang = _preferences?.getString(AppConstants.keyLanguageData);
    if (lang == null) {
      return null;
    }
    final map = jsonDecode(lang);
    if (map == null) {
      return null;
    }
    return LanguageData.fromJson(map);
  }

  void deleteLanguage() => _preferences?.remove(AppConstants.keyLanguageData);

  Future<void> setAuthenticatedWithSocial(bool withSocial) async {
    if (_preferences != null) {
      await _preferences!
          .setBool(AppConstants.keyAuthenticatedWithSocial, withSocial);
    }
  }

  bool getAuthenticatedWithSocial() =>
      _preferences?.getBool(AppConstants.keyAuthenticatedWithSocial) ?? false;

  void deleteAuthenticatedWithSocial() =>
      _preferences?.remove(AppConstants.keyAuthenticatedWithSocial);

  Future<void> setLangLtr(int? backward) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyLangLtr, backward == 0);
    }
  }

  bool getLangLtr() => _preferences?.getBool(AppConstants.keyLangLtr) ?? true;

  void deleteLangLtr() => _preferences?.remove(AppConstants.keyLangLtr);

  void logout() {
    deleteLikedProductsList();
    deleteActiveAddressTile();
    deleteLocalAddressesList();
    deleteIsGuest();
    deleteAddressSelected();
    deleteViewedProductsList();
    deleteSavedShopsList();
    deleteProfileImage();
    deleteLastName();
    deleteFirstName();
    deleteToken();
    deleteSelectedCurrency();
    deleteCartProducts();
    deleteWalletData();
    deleteUser();
    deleteAuthenticatedWithSocial();
  }
}
