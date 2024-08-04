import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_pay/src/core/base/base_change_notifier.dart';
import 'package:smart_pay/src/core/route/navigation_service.dart';
import 'package:smart_pay/src/modules/auth/forgot_password/view/reset_password_view.dart';
import 'package:smart_pay/src/modules/auth/forgot_password/view/verify_identity_view.dart';

class ForgotPasswordController extends BaseChangeNotifier {
  ForgotPasswordController(this._ref);

  final Ref _ref;

  void navigateToResetPassword() {
    _ref.read(navigationService).to(ResetPasswordView.route);
  }

  void navigateToVerifyIdentity() {
    _ref.read(navigationService).to(VerifyidentityView.route);
  }
}

final forgotPasswordNotifier =
    ChangeNotifierProvider((ref) => ForgotPasswordController(ref));
