import 'package:smart_pay/src/core/utils/common_libs.dart';

class ToastService {
  void showSuccess(String message, {String? title = 'Success'}) {
    Get.snackbar(
      title ?? 'Success',
      message,
      backgroundColor: Colors.green.withOpacity(.5),
      colorText: AppColors.white,
    );
  }

  void showError(String message, {String? title = 'Error'}) {
    Get.snackbar(
      title ?? 'Error!',
      message,
      colorText: AppColors.white,
      backgroundColor: Colors.red.withOpacity(.5),
    );
  }

  void showHint(String message, {String? title = 'Hint'}) {
    Get.snackbar(
      title ?? 'Hint',
      message,
      backgroundColor: AppColors.primary.withOpacity(.4),
    );
  }
}

final toastService = Provider((ref) => ToastService());
