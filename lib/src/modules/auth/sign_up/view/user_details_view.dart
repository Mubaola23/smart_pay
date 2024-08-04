import 'package:flutter/gestures.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:smart_pay/src/core/_core.dart';
import 'package:smart_pay/src/modules/auth/sign_up/controller/sign_up_controller.dart';
import 'package:smart_pay/src/modules/auth/sign_up/view/components/country_select_bottomsheet.dart';
import 'package:smart_pay/src/shared/app_textfield.dart';

class UserDetailsView extends ConsumerWidget {
  static const route = 'userDetailsView';
  const UserDetailsView({super.key});

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
                key: controller.userDetailsFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppBackButton(),
                    32.verticalSpace,
                    Text.rich(
                      TextSpan(
                        text: 'Hey there! tell us a bit\nabout',
                        style: heading2.copyWith(
                          color: AppColors.primary,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = controller.navigateToLogin,
                            text: ' yourself',
                            style: heading2.copyWith(
                              color: AppColors.secondary,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                    32.verticalSpace,
                    AppTextField(
                      hintText: 'Full name',
                      onChanged: controller.onFullNameChanged,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: 'Full name field is required',
                        ),
                        FormBuilderValidators.minWordsCount(
                          2,
                          errorText: 'Kindly enter full name',
                        ),
                      ]),
                    ),
                    16.verticalSpace,
                    AppTextField(
                      hintText: 'Username',
                      onChanged: controller.onUserNameChanged,
                    ),
                    16.verticalSpace,
                    const CountrySelectButtomSheet(),
                    16.verticalSpace,
                    AppTextField(
                      hintText: 'Password',
                      onChanged: controller.onPasswordChanged,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: 'Pasword field is required',
                        ),
                        FormBuilderValidators.minLength(
                          6,
                          errorText: 'Password must not be less than 8 digit',
                        ),
                      ]),
                      isPassword: true,
                    ),
                    24.verticalSpace,
                    AppButton(
                      text: 'Continue',
                      onPressed: controller.registerUser,
                    ),
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
