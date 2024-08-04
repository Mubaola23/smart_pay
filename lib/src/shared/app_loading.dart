import 'package:smart_pay/src/core/utils/common_libs.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: CircularProgressIndicator(
        color: AppColors.primary,
        value: 40.r,
        strokeWidth: 1.0,
      ),
    );
  }
}
