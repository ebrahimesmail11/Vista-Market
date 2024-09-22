import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vista_market/src/common/base/app_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
}
