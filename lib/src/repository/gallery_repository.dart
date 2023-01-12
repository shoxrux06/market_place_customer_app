import 'package:image_picker/image_picker.dart';

import '../core/constants/constants.dart';
import '../core/handlers/handlers.dart';
import '../models/models.dart';

abstract class GalleryRepository {
  Future<ApiResult<GalleryUploadResponse>> uploadImage(
      XFile file,
      UploadType uploadType,
      );
}
