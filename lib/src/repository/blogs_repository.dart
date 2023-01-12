import '../core/handlers/handlers.dart';
import '../models/models.dart';

abstract class BlogsRepository {
  Future<ApiResult<BlogsPaginateResponse>> getBlogs(int page, String type);

  Future<ApiResult<BlogDetailsResponse>> getBlogDetails(String uuid);
}
