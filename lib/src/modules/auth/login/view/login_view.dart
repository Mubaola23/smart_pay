import 'package:flutter/gestures.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:smart_pay/src/core/_core.dart';
import 'package:smart_pay/src/modules/auth/login/controller/login_controller.dart';
import 'package:smart_pay/src/modules/auth/login/view/components/social_icon.dart';
import 'package:smart_pay/src/modules/auth/login/view/components/social_or.dart';
import 'package:smart_pay/src/shared/app_textfield.dart';

class LoginView extends ConsumerWidget {
  static const route = '/loginView';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(loginNotifier);
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppBackButton(),
                    32.verticalSpace,
                    Text(
                      'Hi There! 👋',
                      style: heading2.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    8.verticalSpace,
                    Text(
                      'Welcome back, Sign in to your account',
                      style: body.copyWith(
                        color: AppColors.grey,
                      ),
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
                            errorText: 'Invalid email address',
                          ),
                        ],
                      ),
                    ),
                    16.verticalSpace,
                    AppTextField(
                      hintText: 'Password',
                      onChanged: controller.onPasswordChange,
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(
                            errorText: 'Password is required',
                          ),
                          FormBuilderValidators.minLength(
                            6,
                            errorText: 'Password must be at least 6 characters',
                          ),
                        ],
                      ),
                      isPassword: true,
                    ),
                    24.verticalSpace,
                    TextButton(
                        onPressed: controller.navigateToForgotPassword,
                        child: Text(
                          'Forgot Password?',
                          style: body.copyWith(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    24.verticalSpace,
                    AppButton(
                      text: 'Sign In',
                      onPressed: controller.login,
                    ),
                    32.verticalSpace,
                    const SocialOr(),
                    32.verticalSpace,
                    Row(
                      children: [
                        const Expanded(
                            child: SocialIcon(img: AppImages.google)),
                        8.horizontalSpace,
                        const Expanded(child: SocialIcon(img: AppImages.apple))
                      ],
                    ),
                    const Spacer(),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: 'Don’t have an account? ',
                          style: body.copyWith(
                            color: AppColors.grey,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = controller.navigateToSignUp,
                              text: ' Sign up',
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
                    32.verticalSpace,
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
