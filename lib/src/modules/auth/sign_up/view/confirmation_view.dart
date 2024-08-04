import 'package:smart_pay/src/core/utils/app_textstyles.dart';
import 'package:smart_pay/src/core/utils/common_libs.dart';
import 'package:smart_pay/src/modules/auth/sign_up/controller/sign_up_controller.dart';

class ConfirmationView extends ConsumerWidget {
  static const route = 'confirmationView';
  const ConfirmationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(signUpNotifier);
    return Skeleton(
      isBusy: false,
      bodyPadding: const EdgeInsets.symmetric(horizontal: 50).r,
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppImage(
              width: 106.r,
              height: 106.r,
              image: const AssetImage(
                AppImages.confirmation,
              )),
          32.verticalSpace,
          Text(
            'Congratulations, ${controller.authResponse.user?.fullName ?? ''}',
            textAlign: TextAlign.center,
            style: heading2.copyWith(
              color: AppColors.primary,
            ),
          ),
          12.verticalSpace,
          Text(
            'You’ve completed the onboarding,\nyou can start using',
            textAlign: TextAlign.center,
            style: body.copyWith(
              color: AppColors.grey,
            ),
          ),
          12.verticalSpace,
          AppButton(
            text: 'Get Started',
            onPressed: controller.navigateToLogin,
          ),
        ],
      ),
    );
  }
}
