import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:smart_pay/src/core/route/_views.dart';
import 'package:smart_pay/src/core/utils/common_libs.dart';
import 'package:smart_pay/src/modules/auth/sign_up/model/signup_response.dart';
import 'package:smart_pay/src/modules/dashboard/controller/dashboard_controller.dart';
import 'package:smart_pay/src/repository/auth_repository.dart';

class LoginController extends BaseChangeNotifier {
  LoginController(this._ref);
  final Ref _ref;
  final _repo = AuthRepository();
  AuthResponse authResponse = AuthResponse();
  final _localStorage = const FlutterSecureStorage();

  String email = '';
  String password = '';

  final formKey = GlobalKey<FormState>();
  void onEmailChange(val) => email = val;
  void onPasswordChange(val) => password = val;

  Future<void> login() async {
    try {
      formKey.currentState?.save();
      if (!(formKey.currentState?.validate() ?? false)) return;
      setState(state: AppState.loading);
      authResponse = await _repo.login(
        email: email,
        password: password,
      );
      final accountPin = await _localStorage.read(key: 'accountPin');
      if (authResponse.user != null) {
        await _localStorage.write(
            key: 'user', value: userToJson(authResponse.user ?? User()));
        await _localStorage.write(
            key: 'token', value: authResponse.token ?? '');
        if (accountPin != null) {
          navigateToDashboard();
        } else {
          _ref.read(navigationService).to(CreatePinView.route);
        }
      }
    } on AppException catch (ex) {
      _ref.read(toastService).showError(ex.toString());
    } finally {
      setState(state: AppState.idle);
    }
  }

  void navigateToForgotPassword() {
    _ref.read(navigationService).to(ForgotPasswordView.route);
  }

  void navigateToSignUp() {
    _ref.read(navigationService).to(SignUpView.route);
  }

  void navigateToDashboard() {
    _ref.read(dashboardNotifier).fetchSecrete();
  }
}

final loginNotifier = ChangeNotifierProvider((ref) => LoginController(ref));
