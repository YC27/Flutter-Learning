import 'package:dio/dio.dart';

class DioUtils {
  final Dio _dio = Dio();

  DioUtils() {
    _dio.options
      ..baseUrl = "https://geek.itheima.net/v1_0/"
      ..connectTimeout = Duration(seconds: 5)
      ..sendTimeout = Duration(seconds: 5)
      ..receiveTimeout = Duration(seconds: 5);
    // _dio.options.connectTimeout = Duration(seconds: 5);
    // _dio.options.sendTimeout = Duration(seconds: 5);
    // _dio.options.receiveTimeout = Duration(seconds: 5);

    _addInterceptor();
  }

  void _addInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (context, handler) {
          handler.next(context);
        },
        onResponse: (context, handler) {
          if (context.statusCode! >= 200 && context.statusCode! < 300) {
            handler.next(context);
            return;
          }
          handler.reject(DioException(requestOptions: context.requestOptions));
        },
        onError: (context, handler) {
          handler.next(context);
        },
      ),
    );
  }

  Future<Response<dynamic>> get(final String url, {final Map<String, dynamic>? params}) {
    return _dio.get(url, queryParameters: params);
  }
}
