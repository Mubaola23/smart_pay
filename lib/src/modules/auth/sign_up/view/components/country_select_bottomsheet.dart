import 'package:smart_pay/src/core/_core.dart';
import 'package:smart_pay/src/modules/auth/sign_up/controller/sign_up_controller.dart';
import 'package:smart_pay/src/modules/auth/sign_up/view/components/country_textfield.dart';

class CountrySelectButtomSheet extends ConsumerWidget {
  const CountrySelectButtomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(signUpNotifier);

    return GestureDetector(
      onTap: () => showSizeSheet(context, const CountryTextfield()),
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16).r,
        decoration: BoxDecoration(
            color: AppColors.getColorFromHex('#F9FAFB'),
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                text: controller.selectedCountry?.flag ?? '',
                style: heading2,
                children: <TextSpan>[
                  TextSpan(
                    text:
                        '  ${controller.selectedCountry?.code ?? 'Select Country'}  ',
                    style: body.copyWith(
                        color: AppColors.grey, fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: controller.selectedCountry?.name ?? '',
                    style: body.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
            SvgPicture.asset(
              AppImages.arrowDown,
              width: 16.r,
              colorFilter:
                  const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
            )
          ],
        ),
      ),
    );
  }
}
