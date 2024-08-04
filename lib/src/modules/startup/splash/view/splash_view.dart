import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:smart_pay/src/core/route/_views.dart';
import 'package:smart_pay/src/core/utils/common_libs.dart';

class SplashView extends ConsumerStatefulWidget {
  static const route = '/';

  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController animationController2;
  final _localStorage = const FlutterSecureStorage();

  void checkStorage() async {
    final accountPin = await _localStorage.read(key: 'accountPin');
    final userString = await _localStorage.read(key: 'user');
    final token = await _localStorage.read(key: 'token');

    if (accountPin != null && userString != null && token != null) {
      ref.read(navigationService).to(SigninPinView.route);
    } else {
      ref.read(navigationService).to(OnboardingView.route);
    }
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    animationController2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 500), () => checkStorage());
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    animationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    animationController2.forward();

    return Skeleton(
      bodyPadding: EdgeInsets.zero,
      backgroundColor: AppColors.white,
      isBusy: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideTransition(
            position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                .animate(animationController),
            child: SvgPicture.asset(
              AppImages.appLogo,
            ),
          ),
        ],
      ),
    );
  }
}
