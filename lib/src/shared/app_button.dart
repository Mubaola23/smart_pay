import 'package:smart_pay/src/core/utils/app_textstyles.dart';
import 'package:smart_pay/src/core/utils/common_libs.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final double? width;
  final double? height;
  final bool isLoading;

  final Widget? leading;

  const AppButton(
      {super.key,
      this.onPressed,
      required this.text,
      this.width = double.maxFinite,
      this.height = 56,
      this.isLoading = false,
      this.leading});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      // Wrap with SizedBox whenever you want a specific width or height.
      disabledColor: AppColors.grey,

      child: SizedBox(
        width: width,
        height: height,
        child: OutlinedButton.icon(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            side: BorderSide.none,
            backgroundColor:
                onPressed != null ? AppColors.primary : AppColors.grey,
          ),
          label: Text(
            text,
            textAlign: TextAlign.center,
            style: heading2.copyWith(
              fontSize: 16.sp,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Navigator.canPop(context) == true) Navigator.pop(context);
      },
      child: Container(
        width: 40.r,
        height: 40.r,
        margin: const EdgeInsets.only(top: 16).r,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.25, color: Color(0x590B0B0B)),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: SizedBox(
          width: 8,
          height: 14,
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 16.r,
            color: const Color(0xFF030D45),
          ),
        ),
      ),
    );
  }
}
