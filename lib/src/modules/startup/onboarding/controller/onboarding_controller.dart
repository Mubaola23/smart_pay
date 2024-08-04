import 'dart:async';

import 'package:smart_pay/src/core/utils/common_libs.dart';
import 'package:smart_pay/src/modules/auth/login/view/login_view.dart';
import 'package:smart_pay/src/modules/startup/onboarding/model/onboarding_model.dart';
import 'package:smart_pay/src/modules/startup/onboarding/view/components/onboarding_slide.dart';

class OnboardingController extends BaseChangeNotifier {
  OnboardingController(this._ref) {
    initState();
  }
  final Ref _ref;
  final List<OnboardingSlide> slides = <OnboardingSlide>[
    OnboardingSlide(
      onboardingModel: OnboardingModel(
          image: AppImages.onboardingDevice1,
          imageOverlay: AppImages.onboardingIllustration1,
          title: 'Finance app the safest and most trusted',
          subtitle:
              'Your finance work starts here. Our here to help you track and deal with speeding up your transactions.'),
    ),
    OnboardingSlide(
      onboardingModel: OnboardingModel(
          image: AppImages.onboardingDevice2,
          imageOverlay: AppImages.onboardingIllustration2,
          title: 'The fastest transaction process only here',
          subtitle:
              'Get easy to pay all your bills with just a few steps. Paying your bills become fast and efficient.'),
    )
  ];
  int currentIndex = 0;
  late PageController pageController;
  late Timer? _pageAnimationTimer;

  void animateSlides() {
    if (currentIndex < 4) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }

  void initState() {
    _pageAnimationTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      animateSlides();
    });
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageAnimationTimer?.cancel();
    _pageAnimationTimer = null;
    pageController.dispose();
    super.dispose();
  }

  void onPageChanged(val) {
    currentIndex = val;
    setState();
  }

  void navigateToLogin() {
    _ref.read(navigationService).clearAllTo(LoginView.route);
  }
}

final onboardingNotifier =
    ChangeNotifierProvider.autoDispose((ref) => OnboardingController(ref));
