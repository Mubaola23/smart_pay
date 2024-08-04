import 'package:smart_pay/src/core/_core.dart';
import 'package:smart_pay/src/shared/app_textfield.dart';

class ResetPasswordView extends ConsumerWidget {
  static const route = '/resetPasswordView';
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final controller = ref.watch(forgotPasswordNotifier);
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

                  24.verticalSpace,
                  Text(
                    'Create New Password',
                    style: heading2.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    'Please, enter a new password below different from the previous password',
                    style: body.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  32.verticalSpace,
                  const AppTextField(
                    hintText: 'Password',
                    isPassword: true,
                  ),
                  16.verticalSpace,
                  const AppTextField(
                    hintText: 'Confirm password',
                    isPassword: true,
                  ),
                  const Spacer(),
                  const AppButton(text: 'Create new password'),
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
