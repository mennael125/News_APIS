import 'package:dio/dio.dart';

class DioHelper {

  static late Dio dio;

  static init() {
    dio = Dio(
        BaseOptions(
          baseUrl: 'https://newsapi.org/',
          receiveDataWhenStatusError: true,

        )
    );
  }

  static  Future <Response<dynamic>> getData({
    required String path,
    required Map<String, dynamic> queryParameters
  })
  async
  {
    return await dio.get(path, queryParameters:queryParameters);
  }

}
