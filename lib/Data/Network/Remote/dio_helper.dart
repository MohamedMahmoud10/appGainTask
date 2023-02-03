
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/end_point.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    BaseOptions baseOptions = BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: baseUrl,
    );
    dio = Dio(baseOptions);
  }
  static void logResponse(Response response) {
    if (kDebugMode) {
      print("Headers: ${response.headers}");
      print("Response: ${response.data}");
      print("Response: ${response.extra}");
    }
  }

  static Future<Response> getAllMovies(int? currentPage) async {
    return await dio.get(popularMoviePath, queryParameters: {
      'api_key': apiKey,
      'language': 'en-US',
      'page': currentPage
    }).then((value) {
      logResponse(value);
      return value;
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return error;
    });
  }

  static Future<Response> getMovieDetails({required int id}) async {
    return await dio.get('$movieDetailsPath$id', queryParameters: {
      'api_key': apiKey,
      'language': 'en-US',
    }).then((value) {
      logResponse(value);
      return value;
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return error;
    });
    // then((value) {
    //   return value;
    // }).catchError((error) {
    //   if (kDebugMode) {
    //     print(error.toString());
    //   }
    //   return error;
    // });
  }

  Future<Response> getNowPlayingMovies() async {
    return await dio.get(nowPlayingMoviePath, queryParameters: {
      'api_key': apiKey,
    }).then((value) {
      return value;
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return error;
    });
  }
}
