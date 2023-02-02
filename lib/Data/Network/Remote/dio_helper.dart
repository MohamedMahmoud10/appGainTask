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
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      logPrint: print,
    ));
  }

  static Future<Response> getAllMovies(int?currentPage) async {
    return await dio.get(popularMoviePath, queryParameters: {
      'api_key': apiKey,
      'language': 'en-US',
      'page': currentPage
    }).then((value) {
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

  /* Future<Response> getTopRatedMovies() async {
    return await dio.get(topRatedMovie, queryParameters: {
      'api_key': apiKey,
      'language': 'en-US',
      'page': 1
    }).then((value) {
      return value;
    }).catchError((error) {
      if (kDebugMode) {
        print('getTopRatedMovies : ' + error.toString());
      }
      return error;
    });
  }*/

  Future<Response> getTrendingMovies({required int pageNumber}) async {
    return await dio.get(trendingMovie, queryParameters: {
      'api_key': apiKey,
      'page': pageNumber,
    }).then((value) {
      return value;
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return error;
    });
  }

  Future<Response> getPopularPersons() async {
    return await dio.get(popularPersonsPath, queryParameters: {
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

  // Future<MovieDetailsModel> getMovieDetails(int movieId) async {
  //   return await dio.get('$movieDetailsPath$movieId', queryParameters: {
  //     'api_key': apiKey,
  //     'language': 'en-US',
  //   }).then((value) async {
  //     MovieDetailsModel movieDetailsModel =
  //     MovieDetailsModel.fromJson(value.data);
  //     movieDetailsModel.trailerId = await getTrailerId(movieId);
  //     movieDetailsModel.movieImage = await getMovieImage(movieId);
  //     movieDetailsModel.castList = await getCastList(movieId);
  //
  //     if (kDebugMode) {
  //       print('movie length ${movieDetailsModel.movieImage!.posters.length}');
  //     }
  //
  //     return movieDetailsModel;
  //   }).catchError((error) {
  //     if (kDebugMode) {
  //       print(error.toString());
  //     }
  //     return error;
  //   });
  // }

  // static getMovieImage(int movieId) async {
  //   return await dio.get('/movie/$movieId/images', queryParameters: {
  //     'api_key': apiKey,
  //     'language': 'en-US',
  //   }).then((value) {
  //     return MovieImagesModel.fromJson(value.data);
  //   }).catchError((error) {
  //     if (kDebugMode) {
  //       print(error.toString());
  //     }
  //     return error;
  //   });
  // }

  static Future<String?> getTrailerId(int id) async {
    return await dio.get('/movie/$id/videos', queryParameters: {
      'api_key': apiKey,
    }).then((value) {
      var youtubeId = value.data['results'][0]['key'];
      return youtubeId;
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return error;
    });
  }

// static getCastList(int movieId) async {
//   return await dio.get('/movie/$movieId/credits', queryParameters: {
//     'api_key': apiKey,
//   }).then((value) {
//     var list = value.data['cast'] as List;
//     List<Cast> castList = list
//         .map((i) => Cast(
//       name: i['name'],
//       character: i['character'],
//       profilePath: i['profile_path'],
//     ))
//         .toList();
//     return castList;
//   }).catchError((error) {
//     if (kDebugMode) {
//       print(error.toString());
//     }
//     return error;
//   });
// }
}
