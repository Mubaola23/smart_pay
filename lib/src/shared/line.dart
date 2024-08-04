import 'package:smart_pay/src/core/utils/common_libs.dart';

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: AppColors.getColorFromHex('#E5E7EB'),
      height: 5,
    );
  }
}
