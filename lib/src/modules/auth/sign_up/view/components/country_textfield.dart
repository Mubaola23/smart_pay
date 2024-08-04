import 'package:smart_pay/src/core/utils/app_textstyles.dart';
import 'package:smart_pay/src/core/utils/common_libs.dart';
import 'package:smart_pay/src/modules/auth/sign_up/controller/sign_up_controller.dart';
import 'package:smart_pay/src/shared/app_textfield.dart';

class CountryTextfield extends ConsumerWidget {
  const CountryTextfield({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(signUpNotifier);
    return Container(
      padding: const EdgeInsets.all(16).r,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  onChanged: controller.onSearchCountry,
                  hintText: ' Select Country',
                  prefixWidget: const Icon(Icons.search),
                ),
              ),
              8.horizontalSpace,
              Text(
                'Cancel',
                style: body.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          if (controller.searchCountryAndFlagModel.isNotEmpty) ...[
            SizedBox(
              width: double.infinity,
              height: 517.h,
              child: ListView.builder(
                itemCount: controller.searchCountryAndFlagModel.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      controller.onCountryChanged(
                          controller.searchCountryAndFlagModel[index]);
                    },
                    leading: Text(
                      controller.searchCountryAndFlagModel[index].flag,
                      style: heading2,
                    ),
                    title: Text.rich(
                      TextSpan(
                        text:
                            '${controller.searchCountryAndFlagModel[index].code}   ',
                        style: body.copyWith(
                          color: AppColors.grey,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: controller
                                  .searchCountryAndFlagModel[index].name,
                              style:
                                  body.copyWith(fontWeight: FontWeight.w600)),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  );
                },
              ),
            )
          ] else ...[
            SizedBox(
              width: double.infinity,
              height: 517.h,
              child: ListView.builder(
                itemCount: controller.countryAndFlagModel.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      controller.onCountryChanged(
                          controller.countryAndFlagModel[index]);
                    },
                    leading: Text(
                      controller.countryAndFlagModel[index].flag,
                      style: heading2,
                    ),
                    title: Text.rich(
                      TextSpan(
                        text:
                            '${controller.countryAndFlagModel[index].code}   ',
                        style: body.copyWith(
                          color: AppColors.grey,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: controller.countryAndFlagModel[index].name,
                              style:
                                  body.copyWith(fontWeight: FontWeight.w600)),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  );
                },
              ),
            )
          ],
        ],
      ),
    );
  }
}
