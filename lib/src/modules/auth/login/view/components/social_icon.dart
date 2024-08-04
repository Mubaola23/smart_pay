import 'package:smart_pay/src/core/_core.dart';

class SocialIcon extends StatelessWidget {
  final String img;
  const SocialIcon({
    super.key,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16).r,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: AppColors.getColorFromHex('#E5E7EB'), width: 1)),
      child: SvgPicture.asset(img),
    );
  }
}
