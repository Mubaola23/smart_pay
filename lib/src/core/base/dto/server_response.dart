import 'package:smart_pay/src/core/utils/common_libs.dart';

class ServerResponse {
  String? message;
  dynamic data;
  List<dynamic>? meta;
  bool? status;
  bool? success;
  String? error;

  ServerResponse({
    this.message,
    this.data,
    this.status,
    this.success,
    this.error,
  });

  factory ServerResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return ServerResponse();

    return ServerResponse(
      message: json['message'] ?? '',
      data: json['data'] ?? [],
      status: json['status'] ?? false,
      success: json['success'] ?? false,
      error: (isObject(json['errors'])
              ? ((json['errors']['email'] != null
                      ? json['errors']['email'][0]
                      : json['errors']['password'] != null
                          ? json['errors']['password'][0]
                          : json['errors'] ?? '') as String? ??
                  '')
              : json['errors'] as String?) ??
          (json['message'] ?? ''),
    );
  }
}
