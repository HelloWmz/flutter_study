import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioUtils {

  // 单例公开访问点
  factory DioUtils() => instance;

  // 静态私有成员，没有初始化
  static DioUtils instance = DioUtils._instance();
  Dio _dio;
  get dio {
    return _dio;
  }
  // 私有构造函数
  DioUtils._instance() {
    // 具体初始化代码
    _dio = Dio();
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      Logger().e("url = ${options.uri.toString()}");
      Logger().e("params = ${options.data}");
      Logger().e("headers = ${options.headers}");
    }, onResponse: (Response response) {
      Logger().e("code = ${response.statusCode}");
      Logger().e("data = ${response.data}");
    }, onError: (DioError e) {
      Logger().e("type = ${e.type}");
      Logger().e("message = ${e.message}");
      Logger().e("error = ${e.error}");
    }));
  }
}
