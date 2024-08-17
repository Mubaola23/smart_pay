import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:smart_pay/src/core/base/dto/server_response.dart';
import 'package:smart_pay/src/core/exception/app_exception.dart';
import 'package:smart_pay/src/service/api/ssl_config.dart';

class ApiService {
  final _locaStorage = const FlutterSecureStorage();

  ///Header for  endpoints
  static final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  final dio = Dio(
    BaseOptions(
      headers: _headers,
      baseUrl: 'https://mobile-test-2d7e555a4f85.herokuapp.com/api/v1',
      responseType: ResponseType.json,
      followRedirects: true,
    ),
  )..httpClientAdapter =
      IOHttpClientAdapter(createHttpClient: () => smartPayHttpClient);

  Future<ServerResponse> post(
    String url, {
    dynamic body,
    Options? options,
  }) async {
    try {
      if (kDebugMode) {
        print(body.toString());
      }
      var token = await _locaStorage.read(key: 'token');

      final response = await dio.post<dynamic>(url,
          data: body,
          options: options ??
              Options(
                headers: {
                  ..._headers,
                  if (token != null) 'Authorization': 'Bearer $token',
                },
              ));

      return ServerResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw AppException.handleError(e);
    }
  }

  Future<ServerResponse> get(
    String url, {
    dynamic body,
    Options? options,
  }) async {
    try {
      var token = await _locaStorage.read(key: 'token');

      final response = await dio.get<dynamic>(
        url,
        queryParameters: body,
        options: options ??
            Options(
              headers: {
                ..._headers,
                if (token != null) 'Authorization': 'Bearer $token',
              },
            ),
      );

      return ServerResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw AppException.handleError(e);
    }
  }

  Future<ServerResponse> put(
    String url, {
    dynamic body,
    Options? options,
  }) async {
    try {
      if (kDebugMode) {
        print(body.toString());
      }
      var token = await _locaStorage.read(key: 'token');

      final response = await dio.put<dynamic>(
        url,
        data: body,
        options: options ??
            Options(
              headers: {
                ..._headers,
                if (token != null) 'Authorization': 'Bearer $token',
              },
            ),
      );
      return ServerResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw AppException.handleError(e);
    }
  }
}
