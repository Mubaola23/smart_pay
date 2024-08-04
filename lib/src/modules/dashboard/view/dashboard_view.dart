import 'package:smart_pay/src/core/utils/app_textstyles.dart';
import 'package:smart_pay/src/core/utils/common_libs.dart';
import 'package:smart_pay/src/modules/dashboard/controller/dashboard_controller.dart';

class DashboardView extends ConsumerWidget {
  static const route = '/dashboardView';
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(dashboardNotifier);
    return Skeleton(
      isBusy: controller.state.isLoading,
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Dashboard',
          style: heading2.copyWith(
            color: AppColors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.power_settings_new,
              color: AppColors.white,
            ),
            onPressed: controller.logOut,
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi ${controller.user.username ?? ''},',
              style: body.copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text.rich(
              TextSpan(
                text: 'Secrete:',
                style: body.copyWith(
                  color: AppColors.grey,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' ${controller.dashboardResponse?.secret ?? ''}',
                    style: body.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
