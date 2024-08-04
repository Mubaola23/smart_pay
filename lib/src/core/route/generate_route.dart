import 'package:flutter/material.dart';
import 'package:smart_pay/src/core/route/_views.dart';
import 'package:smart_pay/src/core/utils/app_utils/helpers.dart';
import 'package:smart_pay/src/shared/theme_scaffold.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (isEmpty(settings.name!)) {
      return CustomMaterialPageRoute(builder: (_) => const ErrorScreen());
    }

    switch (settings.name) {
      case SplashView.route:
        const page = SplashView();
        return CustomMaterialPageRoute(
            builder: (_) => const ThemeScaffold(child: page));

      case OnboardingView.route:
        const page = OnboardingView();
        return CustomMaterialPageRoute(
            builder: (_) => const ThemeScaffold(child: page));

      case LoginView.route:
        const page = LoginView();
        return CustomMaterialPageRoute(
            builder: (_) => const ThemeScaffold(child: page));

      case ForgotPasswordView.route:
        const page = ForgotPasswordView();
        return CustomMaterialPageRoute(
            builder: (_) => const ThemeScaffold(child: page));

      case VerifyidentityView.route:
        const page = VerifyidentityView();
        return CustomMaterialPageRoute(
            builder: (_) => const ThemeScaffold(child: page));

      case ResetPasswordView.route:
        const page = ResetPasswordView();
        return CustomMaterialPageRoute(
            builder: (_) => const ThemeScaffold(child: page));

      case SignUpView.route:
        const page = SignUpView();
        return CustomMaterialPageRoute(
            builder: (_) => const ThemeScaffold(child: page));

      case OtpAuthenticationView.route:
        const page = OtpAuthenticationView();
        return CustomMaterialPageRoute(
            builder: (_) => const ThemeScaffold(child: page));

      case UserDetailsView.route:
        const page = UserDetailsView();
        return CustomMaterialPageRoute(
            builder: (_) => const ThemeScaffold(child: page));

      case CreatePinView.route:
        const page = CreatePinView();
        return CustomMaterialPageRoute(
            builder: (_) => const ThemeScaffold(child: page));

      case ConfirmationView.route:
        const page = ConfirmationView();
        return CustomMaterialPageRoute(
            builder: (_) => const ThemeScaffold(child: page));

      case DashboardView.route:
        const page = DashboardView();
        return CustomMaterialPageRoute(
            builder: (_) => const ThemeScaffold(child: page));

      case SigninPinView.route:
        const page = SigninPinView();
        return CustomMaterialPageRoute(
            builder: (_) => const ThemeScaffold(child: page));

      default:
        return CustomMaterialPageRoute(builder: (_) => const ErrorScreen());
    }
  }
}

class CustomMaterialPageRoute extends MaterialPageRoute {
  @protected
  @override
  bool get hasScopedWillPopCallback {
    return false;
  }

  CustomMaterialPageRoute({
    required super.builder,
    super.settings,
    super.maintainState,
    super.fullscreenDialog,
  });
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Route does not exist',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
