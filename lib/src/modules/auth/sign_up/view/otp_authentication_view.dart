import 'package:smart_pay/src/core/_core.dart';
import 'package:smart_pay/src/modules/auth/sign_up/controller/sign_up_controller.dart';
import 'package:smart_pay/src/shared/number-pad/number_pad.ui.dart';
import 'package:smart_pay/src/shared/pin_code/pincode_ui.dart';

class OtpAuthenticationView extends ConsumerWidget {
  static const route = '/otpAuthenticationView ';
  const OtpAuthenticationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(signUpNotifier);
    return Skeleton(
      isBusy: controller.state.isLoading,
      backgroundColor: AppColors.background,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBackButton(),
          32.verticalSpace,
          Text(
            'Verify it’s you',
            style: heading2.copyWith(
              color: AppColors.primary,
            ),
          ),
          8.verticalSpace,
          Text(
            'We send a code to ( ******${controller.email.split('@').last} ). Enter it here to verify your identity',
            style: body.copyWith(
              color: AppColors.grey,
            ),
          ),
          32.verticalSpace,
          PinFieldUi(
              length: 5,
              controller: controller.pinController,
              hasError: false,
              obscureText: true,
              onChanged: (val) {}),
          24.verticalSpace,
          const Spacer(),
          67.verticalSpace,
          AppButton(
            text: 'Continue',
            onPressed: controller.verifyEmailToken,
          ),
          24.verticalSpace,
          NumberPadUi(
            onChanged: controller.onOtpChanged,
            defaultValue: controller.pinController.text,
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ],
      )),
    );
  }
}
