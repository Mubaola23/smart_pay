// ignore_for_file: unnecessary_null_comparison

import 'package:smart_pay/src/core/utils/app_textstyles.dart';
import 'package:smart_pay/src/core/utils/common_libs.dart';
import 'package:smart_pay/src/modules/startup/onboarding/controller/onboarding_controller.dart';

class OnboardingView extends ConsumerWidget {
  static const route = '/onboardingView';

  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(onboardingNotifier);
    return Skeleton(
      isBusy: false,
      backgroundColor: AppColors.white,
      bodyPadding: EdgeInsets.zero,
      body: SafeArea(
        child: Column(children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: controller.navigateToLogin,
              child: Padding(
                padding: const EdgeInsets.all(8.0).r,
                child: Text(
                  'Skip',
                  style: body.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: AppColors.secondary),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 29.h,
          ),
          Expanded(
            flex: 2,
            child: PageView(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              children: controller.slides,
            ),
          ),
          21.verticalSpace,
          const BuildIndicator(),
          34.verticalSpace,
          AppButton(
            width: 287.w,
            text: 'Get Started',
            onPressed: controller.navigateToLogin,
          ),
          24.verticalSpace,
        ]),
      ),
    );
  }
}

class BuildIndicator extends ConsumerWidget {
  const BuildIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(onboardingNotifier);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: 6.h,
          width: controller.currentIndex == 0 ? 32.w : 6.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: controller.currentIndex == 0
                ? AppColors.primary
                : AppColors.grey,
          ),
        ),
        8.horizontalSpace,
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: 6.h,
          width: controller.currentIndex == 1 ? 32.w : 6.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: controller.currentIndex == 1
                ? AppColors.primary
                : AppColors.grey,
          ),
        ),
      ],
    );
  }
}
