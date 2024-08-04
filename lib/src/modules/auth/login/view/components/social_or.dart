import 'package:smart_pay/src/core/_core.dart';
import 'package:smart_pay/src/shared/line.dart';

class SocialOr extends StatelessWidget {
  const SocialOr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: HorizontalLine()),
        Text(
          'OR',
          style: bodyMedium.copyWith(
            color: AppColors.grey,
          ),
        ),
        const Expanded(child: HorizontalLine()),
      ],
    );
  }
}
