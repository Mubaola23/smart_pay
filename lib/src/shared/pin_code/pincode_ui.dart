import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smart_pay/src/core/utils/common_libs.dart';
import 'package:smart_pay/src/shared/pin_code/pin_input.dart';

class PinFieldUi extends StatelessWidget {
  const PinFieldUi({
    super.key,
    required this.onChanged,
    this.controller,
    this.onCompleted,
    this.onSubmitted,
    this.autofocus = true,
    this.obscureText = true,
    this.length = 6,
    this.hasError = false,
  });

  final void Function(String) onChanged;
  final void Function(String)? onCompleted;
  final void Function(String)? onSubmitted;
  final bool autofocus;
  final bool obscureText;
  final TextEditingController? controller;
  final int length;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return PinCodeUi(
      appContext: context,
      length: length,
      controller: controller,
      hasError: hasError,
      autoFocus: autofocus,
      autovalidateMode: AutovalidateMode.disabled,
      obscureText: obscureText,
      blinkWhenObscuring: true,
      useHapticFeedback: true,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      pinTheme: PinTheme(
        inactiveFillColor: Colors.blue,
        activeFillColor: Colors.blue,
        selectedFillColor: Colors.blue,
        activeColor: AppColors.secondary,
        selectedColor: AppColors.secondary,
        inactiveColor: Colors.blue,
        errorBorderColor: Colors.red,
      ),
      enableActiveFill: false,
      isUnderline: true,
      keyboardType: TextInputType.none,
      onChanged: onChanged,
      onCompleted: onCompleted,
      onSubmitted: onSubmitted,
    );
  }
}
