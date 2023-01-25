// ignore_for_file: type_annotate_public_apis

import 'package:dio/dio.dart';
import 'package:ethaqapp/core/api/local/hive_reuse.dart';
import 'package:ethaqapp/core/utils/app_const.dart';

import '../end_points.dart';

// ignore: avoid_classes_with_only_static_members
class DioHelper {
  static Dio? dio;

  // ignore: always_declare_return_types
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  // getData ====>>>
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    final String token = HiveReuse.mainBox.get(AppConst.tokenBox) ?? '';
    dio!.options.headers = {
      'Authorization': "Bearer $token",
      'Accept': 'application/json'
    };
    return dio!.get(url, queryParameters: query);
  }

  // postData ====>>>
  static Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    bool formDataIsEnabled = false,
  }) async {
    final String token = HiveReuse.mainBox.get(AppConst.tokenBox) ?? '';
    dio!.options.headers = {
      'Authorization': "Bearer $token",
      'Accept': 'application/json'
    };
    return dio!.post(
      endPoint,
      queryParameters: query,
      data: formDataIsEnabled ? FormData.fromMap(data) : data,
    );
  }

  // putData ====>>>
  static Future<Response> putData({
    required String endPoint,
    Map<String, dynamic>? query,
    bool formDataIsEnabled = false,
    required Map<String, dynamic> data,
  }) async {
    final String token = HiveReuse.mainBox.get(AppConst.tokenBox) ?? '';
    dio!.options.headers = {
      'Authorization': "Bearer $token",
      'Accept': 'application/json'
    };
    return dio!.put(
      endPoint,
      queryParameters: query,
      data: formDataIsEnabled ? FormData.fromMap(data) : data,
    );
  }

  // deleteData ====>>>
  static Future<Response> deleteData({
    required String endPoint,
    Map<String, dynamic>? query,
    bool formDataIsEnabled = false,
    required Map<String, dynamic> data,
  }) async {
    final String token = HiveReuse.mainBox.get(AppConst.tokenBox) ?? '';
    dio!.options.headers = {
      'Authorization': "Bearer $token",
      'Accept': 'application/json'
    };
    return dio!.delete(
      endPoint,
      queryParameters: query,
      data: formDataIsEnabled ? FormData.fromMap(data) : data,
    );
  }
}
