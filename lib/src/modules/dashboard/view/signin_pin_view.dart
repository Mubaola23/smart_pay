import 'package:smart_pay/src/core/_core.dart';
import 'package:smart_pay/src/modules/dashboard/controller/dashboard_controller.dart';
import 'package:smart_pay/src/shared/number-pad/number_pad.ui.dart';
import 'package:smart_pay/src/shared/pin_code/pincode_ui.dart';

class SigninPinView extends ConsumerWidget {
  static const route = '/signinPinView';
  const SigninPinView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(dashboardNotifier);
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
            'Welcome back ${controller.user.username ?? ''}',
            style: heading2.copyWith(
              color: AppColors.primary,
            ),
          ),
          8.verticalSpace,
          Text(
            'We use state-of-the-art security measures to protect your information at all times',
            style: body.copyWith(
              color: AppColors.grey,
            ),
          ),
          32.verticalSpace,
          PinFieldUi(
            length: 5,
            controller: controller.accountPinController,
            hasError: false,
            obscureText: true,
            onChanged: (val) {},
          ),
          24.verticalSpace,
          const Spacer(),
          67.verticalSpace,
          AppButton(
            text: 'Continue',
            onPressed: controller.validateSiginInPin,
          ),
          24.verticalSpace,
          NumberPadUi(
            onChanged: controller.onAccountPinChanged,
            onDeleteTap: () {
              if (controller.accountPinController.text.isNotEmpty) {
                controller.accountPinController.text =
                    controller.accountPinController.text.substring(
                        0, controller.accountPinController.text.length - 1);
              }
            },
            defaultValue: '',
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ],
      )),
    );
  }
}
