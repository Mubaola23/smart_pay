import 'package:smart_pay/src/core/_core.dart';

class AppTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final Function()? onEditingComplete;
  final bool filled;
  final Color? textColor;
  final String? Function(String?)? validator;
  final bool enabled;
  final bool obscureText;
  final bool readOnly;
  final bool floatHint;
  final String? initialValue;
  final Widget? prefixWidget;
  final bool? isPassword;
  final Widget? suffixWidget;
  final TextInputAction textInputAction;
  final TextInputType? textInputType;
  final int minLines;
  final int maxLines;
  final int? maxLength;

  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({
    super.key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.enabled = true,
    this.obscureText = false,
    this.readOnly = false,
    this.initialValue,
    this.textInputAction = TextInputAction.next,
    this.textInputType,
    this.inputFormatters,
    this.floatHint = false,
    this.prefixWidget,
    this.minLines = 1,
    this.maxLines = 1,
    this.onTap,
    this.suffixWidget,
    this.isPassword = false,
    this.maxLength,
    this.onEditingComplete,
    this.filled = true,
    this.textColor,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: body.copyWith(color: widget.textColor ?? AppColors.black),
      controller: widget.controller,
      onChanged: widget.onChanged,
      validator: widget.validator,
      onSaved: widget.onSaved,
      onEditingComplete: widget.onEditingComplete,
      onTap: widget.onTap,

      // maxLength: widget.maxLength,
      maxLengthEnforcement: MaxLengthEnforcement.none,
      autofocus: false,
      enabled: widget.enabled,
      obscureText: widget.isPassword! ? _visible : false,
      readOnly: widget.onTap != null || widget.readOnly,
      cursorColor: widget.textColor ?? AppColors.black,
      initialValue: widget.initialValue,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      inputFormatters: widget.inputFormatters,
      minLines: widget.minLines,
      maxLines:
          widget.minLines > widget.maxLines ? widget.minLines : widget.maxLines,
      decoration: InputDecoration(
        constraints: BoxConstraints(
          maxHeight: 98.h,
          minHeight: 50.h,
        ),
        filled: widget.filled,
        prefixIcon: widget.prefixWidget == null
            ? null
            : Padding(
                padding: EdgeInsets.only(left: 11.w, right: 11.w),
                child: widget.prefixWidget,
              ),
        suffixIcon: widget.suffixWidget ??
            (widget.isPassword!
                ? IconButton(
                    icon: _visible
                        ? SvgPicture.asset(
                            AppImages.eye,
                            colorFilter: const ColorFilter.mode(
                                Color(0xffacacac), BlendMode.srcIn),
                          )
                        : SvgPicture.asset(
                            AppImages.eyeOff,
                            colorFilter: const ColorFilter.mode(
                                Color(0xffacacac), BlendMode.srcIn),
                          ),
                    onPressed: () {
                      setState(() {
                        _visible = !_visible;
                      });
                    },
                  )
                : null),
        fillColor: AppColors.getColorFromHex('#F9FAFB'),
        hintText: widget.floatHint ? null : widget.hintText,
        enabled: widget.enabled,
        labelText: widget.floatHint ? widget.hintText : null,
        labelStyle: body.copyWith(
          color: AppColors.grey,
          fontWeight: FontWeight.w600,
        ),
        hintStyle: body.copyWith(color: AppColors.grey),
        floatingLabelStyle:
            bodySmall.copyWith(color: AppColors.grey, fontSize: 14.sp),
        enabledBorder: enabledBorder,
        disabledBorder: disableBorder,
        focusedBorder: focusedBorder,
        border: focusedBorder,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16).r,
      ),
    );
  }
}

final OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.r),
    borderSide: const BorderSide(color: AppColors.white));

final OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.r),
    borderSide: const BorderSide(color: AppColors.secondary));

final OutlineInputBorder disableBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.r),
    borderSide: const BorderSide(color: AppColors.white));
