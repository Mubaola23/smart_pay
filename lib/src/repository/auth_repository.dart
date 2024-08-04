import 'package:smart_pay/src/core/base/dto/server_response.dart';
import 'package:smart_pay/src/core/utils/common_libs.dart';
import 'package:smart_pay/src/modules/auth/sign_up/model/signup_response.dart';
import 'package:smart_pay/src/modules/dashboard/model/dashboard_response.dart';
import 'package:smart_pay/src/service/api/api_service.dart';

class AuthRepository {
  final _apiService = ApiService();

  Future<ServerResponse> getEmailToken(String email) async {
    ServerResponse response = await _apiService.post(
      '/auth/email',
      body: {
        'email': email,
      },
    );
    return response;
  }

  Future<ServerResponse> verifyEmailToken({
    required String email,
    required String token,
  }) async {
    ServerResponse response = await _apiService.post(
      '/auth/email/verify',
      body: {
        'email': email,
        'token': token,
      },
    );
    return response;
  }

  Future<AuthResponse> register({
    required String email,
    required String username,
    required String fullName,
    required String country,
    required String password,
  }) async {
    ServerResponse response = await _apiService.post(
      '/auth/register',
      body: {
        'full_name': fullName,
        'username': username,
        'email': email,
        'country': country,
        'password': password,
        'device_name': 'mobile'
      },
    );
    return AuthResponse.fromJson(response.data as JSON);
  }

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    ServerResponse response = await _apiService.post(
      '/auth/login',
      body: {
        'email': email,
        'password': password,
        'device_name': 'mobile',
      },
    );
    return AuthResponse.fromJson(response.data as JSON);
  }

  Future<DashboardResponse> dashboard() async {
    ServerResponse response = await _apiService.get(
      '/dashboard',
    );
    return DashboardResponse.fromJson(response.data as JSON);
  }
}
