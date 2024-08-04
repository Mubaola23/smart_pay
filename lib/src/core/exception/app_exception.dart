// ignore_for_file: use_super_parameters

import 'package:dio/dio.dart';
import 'package:smart_pay/src/core/base/dto/server_response.dart';
import 'package:smart_pay/src/core/utils/common_libs.dart';

///App exception exception handle custom exception from the server

class AppException implements Exception {
  final String? _message;

  AppException([this._message]);

  @override
  String toString() {
    return '$_message';
  }

  ///Handle dio error and throw App exception
  static AppException handleError(DioException e) {
    if (!isObjectEmpty(e.response)) {
      if (e.response!.data is Map<String, dynamic>) {
        ServerResponse response = ServerResponse.fromJson(e.response!.data);
        return AppException(response.error ?? 'Something went wrong.');
      }

      throw AppException('Please try again');
    }
    throw AppException(handleExceptionError(e.type));
  }
}

String handleExceptionError(DioExceptionType errorType) {
  switch (errorType) {
    case DioExceptionType.connectionTimeout:
      return 'Please check your internet connection.';

    case DioExceptionType.sendTimeout:
      return 'Sending timeout -Please try again';

    case DioExceptionType.receiveTimeout:
      return 'Receiving timeout -Please try again';

    case DioExceptionType.badCertificate:
      return 'Error Please Try again';

    case DioExceptionType.badResponse:
      return 'Error please try again';

    case DioExceptionType.cancel:
      return ' please try again';

    case DioExceptionType.connectionError:
      return 'Please check your internet connection.';

    case DioExceptionType.unknown:
      return 'Oops! Something went wrong, please try again later.';

    default:
      return 'Oops! Something went wrong, please try again later.';
  }
}
