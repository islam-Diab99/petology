import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    if (kDebugMode) {
      print('Dio initialized');
    }
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://petology.orangedigitalcenteregypt.com/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    String lang = 'en',
    dynamic query,
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json',

    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = 'en',
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };

    return await dio.post(url, queryParameters: query, data: data);
  }
}
