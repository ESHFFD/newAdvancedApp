import 'package:adv_app/app/constant.dart';
import 'package:adv_app/data/responses/responses.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST('/customers/login')
  Future<AuthenticationResponses> login();
}
