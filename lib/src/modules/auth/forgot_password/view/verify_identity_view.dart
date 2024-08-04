import 'package:smart_pay/src/core/_core.dart';
import 'package:smart_pay/src/modules/auth/forgot_password/controller/forgot_password_controller.dart';

class VerifyidentityView extends ConsumerWidget {
  static const route = '/verifyidentityView';
  const VerifyidentityView({super.key});

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
                    'Verify your identity',
                    style: heading2.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  8.verticalSpace,
                  Text.rich(
                    TextSpan(
                      text: 'Where would you like',
                      style: body.copyWith(
                        color: AppColors.grey,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Smartpay',
                          style: body.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.secondary,
                          ),
                        ),
                        const TextSpan(
                          text: ' to send your security code?.',
                        ),
                      ],
                    ),
                  ),
                  32.verticalSpace,
                  ListTile(
                    tileColor: AppColors.getColorFromHex('#F9FAFB'),
                    titleAlignment: ListTileTitleAlignment.center,
                    leading: SvgPicture.asset(AppImages.check),
                    title: Text(
                      'Email',
                      style: body.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      'A*******@mail.com',
                      style: bodySmall.copyWith(
                          fontWeight: FontWeight.w500, color: AppColors.grey),
                    ),
                    trailing: Icon(
                      Icons.mail_outline_rounded,
                      color: AppColors.getColorFromHex('#9CA3AF'),
                    ),
                  ),

                  const Spacer(),
                  AppButton(
                    text: 'Continue',
                    onPressed: controller.navigateToResetPassword,
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
