import 'package:get_it/get_it.dart';
import 'package:google_place/google_place.dart';

import '../../repository/impl/video_repository_impl.dart';
import '../../repository/repository.dart';
import '../../repository/video_repository.dart';
import '../constants/constants.dart';
import '../handlers/handlers.dart';

final GetIt getIt = GetIt.instance;

void setUpDependencies() {
  getIt.registerLazySingleton<HttpService>(() => HttpService());
  getIt.registerSingleton<SettingsRepository>(SettingsSettingsRepositoryImpl());
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  getIt.registerSingleton<ProductsRepository>(ProductsRepositoryImpl());
  getIt.registerSingleton<ShopsRepository>(ShopsRepositoryImpl());
  getIt.registerSingleton<BrandsRepository>(BrandsRepositoryImpl());
  getIt.registerSingleton<GalleryRepository>(GalleryRepositoryImpl());
  getIt.registerSingleton<CategoriesRepository>(CategoriesRepositoryImpl());
  getIt.registerSingleton<CurrenciesRepository>(CurrenciesRepositoryImpl());
  getIt.registerSingleton<AddressRepository>(AddressRepositoryImpl());
  getIt.registerSingleton<BannersRepository>(BannersRepositoryImpl());
  getIt.registerSingleton<GooglePlace>(GooglePlace(AppConstants.googleApiKey));
  getIt.registerSingleton<PaymentsRepository>(PaymentsRepositoryImpl());
  getIt.registerSingleton<OrdersRepository>(OrdersRepositoryImpl());
  getIt.registerSingleton<UserRepository>(UserRepositoryImpl());
  getIt.registerSingleton<BlogsRepository>(BlogsRepositoryImpl());
  getIt.registerSingleton<VideoRepository>(VideoRepositoryImpl());
}

final settingsRepository = getIt.get<SettingsRepository>();
final authRepository = getIt.get<AuthRepository>();
final productsRepository = getIt.get<ProductsRepository>();
final shopsRepository = getIt.get<ShopsRepository>();
final brandsRepository = getIt.get<BrandsRepository>();
final galleryRepository = getIt.get<GalleryRepository>();
final categoriesRepository = getIt.get<CategoriesRepository>();
final currenciesRepository = getIt.get<CurrenciesRepository>();
final addressesRepository = getIt.get<AddressRepository>();
final bannersRepository = getIt.get<BannersRepository>();
final googlePlace = getIt.get<GooglePlace>();
final paymentsRepository = getIt.get<PaymentsRepository>();
final ordersRepository = getIt.get<OrdersRepository>();
final userRepository = getIt.get<UserRepository>();
final blogsRepository = getIt.get<BlogsRepository>();
final videoRepository = getIt.get<VideoRepository>();
