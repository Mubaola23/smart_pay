import 'package:smart_pay/src/core/_core.dart';
import 'package:smart_pay/src/modules/startup/onboarding/model/onboarding_model.dart';

class OnboardingSlide extends StatelessWidget {
  final OnboardingModel onboardingModel;
  const OnboardingSlide({
    super.key,
    required this.onboardingModel,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: AppImage(
              width: 300.w,
              // height: 267.w,
              image: AssetImage(
                onboardingModel.image,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                AppColors.white.withOpacity(0.4),
                AppColors.white,
                AppColors.white,
                AppColors.white,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              onboardingModel.imageOverlay,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 287.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    onboardingModel.title,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: heading2.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  16.verticalSpace,
                  Text(
                    onboardingModel.subtitle,
                    textAlign: TextAlign.center,
                    style: body.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: AppImage(
                  width: 367.w,
                  // height: 267.w,
                  image: AssetImage(
                    onboardingModel.imageOverlay,
                  ))),
        ],
      ),
    );
  }
}
