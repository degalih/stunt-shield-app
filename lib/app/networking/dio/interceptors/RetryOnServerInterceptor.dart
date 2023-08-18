import 'package:nylo_framework/nylo_framework.dart';

class RetryOnServerErrorInterceptor extends Interceptor {
  final int maxRetries;

  RetryOnServerErrorInterceptor({this.maxRetries = 3});

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 500) {
      int retryCount = 0;

      while (retryCount < maxRetries) {
        try {
          // Tunggu sebentar sebelum melakukan retry (misalnya 1 detik)
          await Future.delayed(Duration(seconds: 1));
          // Lakukan retry dengan mengirim kembali permintaan yang sama
          final response = await Dio().fetch(err.requestOptions);
          return handler.resolve(response);
        } catch (e) {
          retryCount++;
        }
      }
    }

    return super.onError(err, handler);
  }
}
