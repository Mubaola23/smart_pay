import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:smart_pay/src/core/route/_views.dart';
import 'package:smart_pay/src/core/utils/common_libs.dart';
import 'package:smart_pay/src/modules/auth/sign_up/model/signup_response.dart';
import 'package:smart_pay/src/modules/dashboard/model/dashboard_response.dart';
import 'package:smart_pay/src/repository/auth_repository.dart';

class DashboardController extends BaseChangeNotifier {
  DashboardController(this._ref) {
    fetchUser();
  }
  final Ref _ref;
  final _localStorage = const FlutterSecureStorage();
  final _repo = AuthRepository();

  DashboardResponse? dashboardResponse;

  TextEditingController accountPinController = TextEditingController();
  void onAccountPinChanged(val) => accountPinController.text += val;

  User user = User();

  Future validateSiginInPin() async {
    try {
      setState(state: AppState.loading);
      final pinString = await _localStorage.read(key: 'accountPin');
      if (pinString != null) {
        if (pinString == accountPinController.text) {
          await fetchSecrete();
        } else {
          _ref.read(toastService).showError('Invalid account pin');
        }
      } else {
        _ref.read(toastService).showError('Invalid account pin');
      }
    } catch (e) {
      _ref.read(toastService).showError(e.toString());
    } finally {
      setState(state: AppState.idle);
    }
  }

  Future fetchUser() async {
    try {
      setState(state: AppState.loading);
      final userString = await _localStorage.read(key: 'user');
      if (userString != null) {
        user = userFromJson(userString);
      }
    } catch (e) {
      _ref.read(toastService).showError(e.toString());
    } finally {
      setState(state: AppState.idle);
    }
  }

  Future fetchSecrete() async {
    try {
      setState(state: AppState.loading);
      dashboardResponse = await _repo.dashboard();
      if (dashboardResponse?.secret != null) {
        _ref.read(navigationService).to(DashboardView.route);
      } else {
        _ref.read(toastService).showError('Unable to fetch Secrete');
      }
    } on AppException catch (ex) {
      _ref.read(toastService).showError(ex.toString());
    } finally {
      setState(state: AppState.idle);
    }
  }

  void logOut() async {
    await _localStorage.deleteAll();
    _ref.read(navigationService).clearAllTo(OnboardingView.route);
  }
}

final dashboardNotifier =
    ChangeNotifierProvider((ref) => DashboardController(ref));
