import 'package:flutter/gestures.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:smart_pay/src/core/_core.dart';
import 'package:smart_pay/src/modules/auth/login/view/components/social_icon.dart';
import 'package:smart_pay/src/modules/auth/login/view/components/social_or.dart';
import 'package:smart_pay/src/modules/auth/sign_up/controller/sign_up_controller.dart';
import 'package:smart_pay/src/shared/app_textfield.dart';

class SignUpView extends ConsumerWidget {
  static const route = '/signUpView';
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(signUpNotifier);
    return Skeleton(
      isBusy: controller.state.isLoading,
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppBackButton(),
                    32.verticalSpace,
                    Text.rich(
                      TextSpan(
                        text: 'Create a',
                        style: heading2.copyWith(
                          color: AppColors.primary,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = controller.navigateToLogin,
                            text: ' Smartpay\n',
                            style: heading2.copyWith(
                              color: AppColors.secondary,
                            ),
                          ),
                          const TextSpan(
                            text: 'account',
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                    32.verticalSpace,
                    AppTextField(
                      hintText: 'Email',
                      onChanged: controller.onEmailChange,
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(
                            errorText: 'Email is required',
                          ),
                          FormBuilderValidators.email(
                            errorText: 'Enter a valid email',
                          ),
                        ],
                      ),
                    ),
                    24.verticalSpace,
                    AppButton(
                      text: 'Sign Up',
                      onPressed: controller.sendEmailToken,
                    ),
                    32.verticalSpace,
                    const SocialOr(),
                    32.verticalSpace,
                    Row(
                      children: [
                        const Expanded(
                          child: SocialIcon(img: AppImages.google),
                        ),
                        8.horizontalSpace,
                        const Expanded(
                          child: SocialIcon(img: AppImages.apple),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: 'Already have an account? ',
                          style: body.copyWith(
                            color: AppColors.grey,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = controller.navigateToLogin,
                              text: ' Sign In',
                              style: body.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.secondary,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
