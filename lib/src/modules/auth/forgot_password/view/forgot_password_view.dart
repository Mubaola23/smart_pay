import 'package:smart_pay/src/core/_core.dart';
import 'package:smart_pay/src/modules/auth/forgot_password/controller/forgot_password_controller.dart';
import 'package:smart_pay/src/shared/app_textfield.dart';

class ForgotPasswordView extends ConsumerWidget {
  static const route = '/forgotPasswordView';
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(forgotPasswordNotifier);
    return Skeleton(
      isBusy: false,
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //user should be able to navigate back to previous screen.
                  const AppBackButton(),
                  35.verticalSpace,
                  SvgPicture.asset(
                    AppImages.passwordRecovery,
                  ),
                  24.verticalSpace,
                  Text(
                    'Passsword Recovery',
                    style: heading2.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    'Enter your registered email below to receive password instructions',
                    style: body.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  32.verticalSpace,
                  const AppTextField(
                    hintText: 'Email',
                  ),
                  const Spacer(),
                  AppButton(
                    text: 'Send me email',
                    onPressed: controller.navigateToVerifyIdentity,
                  ),
                  36.verticalSpace,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
