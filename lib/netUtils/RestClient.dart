import 'package:dio/dio.dart';
import 'package:flutterstudy/bean/SendMessageBean.dart';
import 'package:retrofit/retrofit.dart';
part 'RestClient.g.dart';
//flutter pub run build_runner build
@RestApi(baseUrl: "http://202.106.235.34:10065/cas/v1/")
abstract class RestClient  {
  factory RestClient (Dio dio, {String baseUrl}) = _RestClient;

  @GET("verifycode/sendMessageFastRegistration")
  Future<SendMessageBean> sendMessageFastRegistration(@Queries() Map<String, dynamic> queries);
}
