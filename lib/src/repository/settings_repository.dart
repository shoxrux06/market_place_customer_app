import '../core/handlers/handlers.dart';
import '../models/models.dart';

abstract class SettingsRepository {
  Future<ApiResult<GlobalSettingsResponse>> getGlobalSettings();

  Future<ApiResult<MobileTranslationsResponse>> getMobileTranslations();

  Future<ApiResult<LanguagesResponse>> getLanguages();
}
