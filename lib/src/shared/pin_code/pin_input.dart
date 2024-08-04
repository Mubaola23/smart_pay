// ignore_for_file: prefer_asserts_with_message

import 'dart:async';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smart_pay/src/core/utils/app_textstyles.dart';
import 'package:smart_pay/src/core/utils/common_libs.dart';

/// Pin code text fields which automatically changes focus and validates
class PinCodeUi extends StatefulWidget {
  const PinCodeUi({
    super.key,
    required this.appContext,
    required this.length,
    this.controller,
    this.obscureText = false,
    this.obscuringWidget,
    this.blinkWhenObscuring = false,
    this.blinkDuration = const Duration(milliseconds: 500),
    this.onChanged,
    this.hasError = false,
    this.onCompleted,
    this.keyboardType = TextInputType.visiblePassword,
    this.autoFocus = false,
    this.focusNode,
    this.onTap,
    this.enabled = true,
    this.inputFormatters = const <TextInputFormatter>[],
    this.useHapticFeedback = false,
    this.hapticFeedbackTypes = HapticFeedbackTypes.light,
    this.enableActiveFill = false,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.done,
    this.autoDismissKeyboard = true,
    this.autoDisposeControllers = false,
    this.onSubmitted,
    this.errorAnimationController,
    this.beforeTextPaste,
    this.dialogConfig,
    this.pinTheme = const PinTheme.defaults(),
    this.keyboardAppearance,
    this.validator,
    this.onSaved,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.errorTextSpace = 16,
    this.errorTextDirection = TextDirection.ltr,
    this.errorTextMargin = EdgeInsets.zero,
    this.enablePinAutofill = true,
    this.errorAnimationDuration = 500,
    this.textGradient,
    this.readOnly = false,
    this.autoUnfocus = true,

    /// Default for [AutofillGroup]
    this.onAutoFillDisposeAction = AutofillContextAction.commit,

    /// Default create internal [AutofillGroup]
    this.useExternalAutoFillGroup = false,
    this.scrollPadding = const EdgeInsets.all(20),
    this.isUnderline = false,
  });

  /// The [BuildContext] of the application
  final BuildContext appContext;

  /// length of how many cells there should be. 3-8 is recommended by me
  final int length;

  /// toggles between underline or box pin field
  final bool isUnderline;

  /// you already know what it does i guess :P default is false
  final bool obscureText;

  final bool hasError;

  /// Widget used to obscure text
  ///
  /// it overrides the obscuringCharacter
  final Widget? obscuringWidget;

  /// Whether to use haptic feedback or not
  ///
  ///
  final bool useHapticFeedback;

  /// Haptic Feedback Types
  ///
  /// heavy, medium, light links to respective impacts
  /// selection - selectionClick, vibrate - vibrate
  /// check [HapticFeedback] for more
  final HapticFeedbackTypes hapticFeedbackTypes;

  /// Decides whether typed character should be
  /// briefly shown before being obscured
  final bool blinkWhenObscuring;

  /// Blink Duration if blinkWhenObscuring is set to true
  final Duration blinkDuration;

  /// returns the current typed text in the fields
  final ValueChanged<String>? onChanged;

  /// returns the typed text when all pins are set
  final ValueChanged<String>? onCompleted;

  /// returns the typed text when user presses done/next action on the keyboard
  final ValueChanged<String>? onSubmitted;

  /// [TextInputType] for the pin code fields. default is [TextInputType.visiblePassword]
  final TextInputType keyboardType;

  /// If the pin code field should be autofocused or not. Default is `false`
  final bool autoFocus;

  /// Should pass a [FocusNode] to manage it from the parent
  final FocusNode? focusNode;

  /// A list of [TextInputFormatter] that goes to the TextField
  final List<TextInputFormatter> inputFormatters;

  /// Enable or disable the Field. Default is `true`
  final bool enabled;

  /// [TextEditingController] to control the text manually. Sets a default [TextEditingController()] object if none given
  final TextEditingController? controller;

  /// Enabled Color fill for individual pin fields, default is `false`
  final bool enableActiveFill;

  /// Auto dismiss the keyboard upon inputting the value for the last field. Default is `true`
  final bool autoDismissKeyboard;

  /// Auto dispose the [controller] and [FocusNode] upon the destruction of widget from the widget tree. Default is `true`
  final bool autoDisposeControllers;

  /// Configures how the platform keyboard will select an uppercase or lowercase keyboard.
  /// Only supports text keyboards, other keyboard types will ignore this configuration. Capitalization is locale-aware.
  /// - Copied from 'https://api.flutter.dev/flutter/services/TextCapitalization-class.html'
  /// Default is [TextCapitalization.none]
  final TextCapitalization textCapitalization;

  final TextInputAction textInputAction;

  /// Triggers the error animation
  final StreamController<ErrorAnimationType>? errorAnimationController;

  /// Callback method to validate if text can be pasted. This is helpful when we need to validate text before pasting.
  /// e.g. validate if text is number. Default will be pasted as received.
  final bool Function(String? text)? beforeTextPaste;

  /// Method for detecting a pin_code form tap
  /// work with all form windows
  final VoidCallback? onTap;

  /// Configuration for paste dialog. Read more [DialogConfig]
  final DialogConfig? dialogConfig;

  /// Theme for the pin cells. Read more [PinTheme]
  final PinTheme pinTheme;

  /// Brightness dark or light choices for iOS keyboard.
  final Brightness? keyboardAppearance;

  /// Validator for the [TextFormField]
  final FormFieldValidator<String>? validator;

  /// An optional method to call with the final value when the form is saved via
  /// [FormState.save].
  final FormFieldSetter<String>? onSaved;

  /// enables auto validation for the [TextFormField]
  /// Default is [AutovalidateMode.onUserInteraction]
  final AutovalidateMode autovalidateMode;

  /// The vertical padding from the [PinCodeUi] to the error text
  /// Default is 16.
  final double errorTextSpace;

  /// Margin for the error text
  /// Default is [EdgeInsets.zero].
  final EdgeInsets errorTextMargin;

  /// [TextDirection] to control a direction in which text flows.
  /// Default is [TextDirection.ltr]
  final TextDirection errorTextDirection;

  /// Enables pin autofill for TextFormField.
  /// Default is true
  final bool enablePinAutofill;

  /// Error animation duration
  final int errorAnimationDuration;

  /// Autofill cleanup action
  final AutofillContextAction onAutoFillDisposeAction;

  /// Use external `AutoFillGroup`
  final bool useExternalAutoFillGroup;

  /// ScrollPadding follows the same property as TextField's ScrollPadding, default to
  /// const EdgeInsets.all(20),
  final EdgeInsets scrollPadding;

  /// Text gradient for Pincode
  final Gradient? textGradient;

  /// Makes the pin cells readOnly
  final bool readOnly;

  /// Enable auto unfocus
  final bool autoUnfocus;

  @override
  State<PinCodeUi> createState() => _PinCodeUiState();
}

class _PinCodeUiState extends State<PinCodeUi> with TickerProviderStateMixin {
  TextEditingController? _textEditingController;
  FocusNode? _focusNode;
  late List<String> _inputList;
  int _selectedIndex = 0;
  BorderRadius? borderRadius;

  // Whether the character has blinked
  bool _hasBlinked = false;

  // AnimationController for the error animation
  late AnimationController _controller;

  late AnimationController _cursorController;

  StreamSubscription<ErrorAnimationType>? _errorAnimationSubscription;
  bool isInErrorMode = false;

  // Animation for the error animation
  late Animation<Offset> _offsetAnimation;

  late Animation<double> _cursorAnimation;
  DialogConfig get _dialogConfig => widget.dialogConfig == null
      ? DialogConfig()
      : DialogConfig(
          affirmativeText: widget.dialogConfig!.affirmativeText,
          dialogContent: widget.dialogConfig!.dialogContent,
          dialogTitle: widget.dialogConfig!.dialogTitle,
          negativeText: widget.dialogConfig!.negativeText,
        );

  Timer? _blinkDebounce;

  @override
  void initState() {
    _checkForInvalidValues();
    _assignController();

    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode!.addListener(() {
      setState(() {});
    }); // Rebuilds on every change to reflect the correct color on each field.
    _inputList = List<String>.filled(widget.length, '');

    _hasBlinked = true;

    _cursorController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _cursorAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _cursorController,
        curve: Curves.easeIn,
      ),
    );
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.errorAnimationDuration),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(.1, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticIn,
      ),
    );

    _cursorController.repeat();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });

    if (widget.errorAnimationController != null) {
      _errorAnimationSubscription =
          widget.errorAnimationController!.stream.listen((errorAnimation) {
        if (errorAnimation == ErrorAnimationType.shake && mounted) {
          _controller.forward();
          setState(() => isInErrorMode = true);
        }
      });
    }
    // If a default value is set in the TextEditingController, then set to UI
    if (_textEditingController!.text.isNotEmpty) {
      _setTextToInput(_textEditingController!.text);
    }
    super.initState();
  }

  // validating all the values
  void _checkForInvalidValues() {
    assert(
      _dialogConfig.affirmativeText != null &&
          _dialogConfig.affirmativeText!.isNotEmpty,
    );
    assert(
      _dialogConfig.negativeText != null &&
          _dialogConfig.negativeText!.isNotEmpty,
    );
    assert(
      _dialogConfig.dialogTitle != null &&
          _dialogConfig.dialogTitle!.isNotEmpty,
    );
    assert(
      _dialogConfig.dialogContent != null &&
          _dialogConfig.dialogContent!.isNotEmpty,
    );
  }

  void runHapticFeedback() {
    switch (widget.hapticFeedbackTypes) {
      case HapticFeedbackTypes.heavy:
        HapticFeedback.heavyImpact();
        break;

      case HapticFeedbackTypes.medium:
        HapticFeedback.mediumImpact();
        break;

      case HapticFeedbackTypes.light:
        HapticFeedback.lightImpact();
        break;

      case HapticFeedbackTypes.selection:
        HapticFeedback.selectionClick();
        break;

      case HapticFeedbackTypes.vibrate:
        HapticFeedback.vibrate();
        break;
    }
  }

  // Assigning the text controller, if empty assiging a new one.
  void _assignController() {
    if (widget.controller == null) {
      _textEditingController = TextEditingController();
    } else {
      _textEditingController = widget.controller;
    }

    _textEditingController?.addListener(() {
      if (widget.useHapticFeedback) {
        runHapticFeedback();
      }

      if (isInErrorMode && mounted) {
        setState(() => isInErrorMode = false);
      }

      _debounceBlink();

      var currentText = _textEditingController!.text;

      if (widget.enabled && _inputList.join() != currentText) {
        if (currentText.length >= widget.length) {
          if (widget.onCompleted != null) {
            if (currentText.length > widget.length) {
              // removing extra text longer than the length
              currentText = currentText.substring(0, widget.length);
            }
            //  delay the onComplete event handler to give the onChange event handler enough time to complete
            Future.delayed(
              const Duration(milliseconds: 100),
              () => widget.onCompleted!(currentText),
            );
          }

          if (widget.autoDismissKeyboard) _focusNode!.unfocus();
        }
        widget.onChanged?.call(currentText);
      }

      _setTextToInput(currentText);
    });
  }

  void _debounceBlink() {
    // set has blinked to false and back to true
    // after duration
    if (widget.blinkWhenObscuring &&
        _textEditingController!.text.length >
            _inputList.where((x) => x.isNotEmpty).length) {
      if (mounted) {
        setState(() {
          _hasBlinked = false;
        });
      }

      if (_blinkDebounce?.isActive ?? false) {
        _blinkDebounce!.cancel();
      }

      _blinkDebounce = Timer(widget.blinkDuration, () {
        if (mounted) {
          setState(() {
            _hasBlinked = true;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    if (widget.autoDisposeControllers) {
      _textEditingController!.dispose();
      _focusNode!.dispose();
    }

    _errorAnimationSubscription?.cancel();

    _cursorController.dispose();

    _controller.dispose();
    super.dispose();
  }

  Widget _renderPinField({required int? index}) {
    assert(index != null);

    final showObscured = !widget.blinkWhenObscuring ||
        (widget.blinkWhenObscuring && _hasBlinked) ||
        index != _inputList.where((x) => x.isNotEmpty).length - 1;

    if (widget.obscuringWidget != null) {
      if (showObscured) {
        if (_inputList[index!].isNotEmpty) {
          return widget.obscuringWidget!;
        }
      }
    }

    final text =
        widget.obscureText && _inputList[index!].isNotEmpty && showObscured
            ? '●'
            : _inputList[index!];

    return Text(
      text,
      style: body.copyWith(
        color: AppColors.primary,
        decoration: TextDecoration.none,
      ),
      key: ValueKey(_inputList[index]),
    );
  }

  /// Builds the widget to be shown
  Widget buildChild(int index) {
    if (((_selectedIndex == index) ||
            (_selectedIndex == index + 1 && index + 1 == widget.length)) &&
        _focusNode!.hasFocus) {
      if (_selectedIndex == index + 1 && index + 1 == widget.length) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 21),
                child: FadeTransition(
                  opacity: _cursorAnimation,
                  child: CustomPaint(
                    size: const Size(0, 14),
                    painter: CursorPainter(
                      cursorColor:
                          widget.hasError ? Colors.red : AppColors.primary,
                      cursorWidth: 1,
                    ),
                  ),
                ),
              ),
            ),
            _renderPinField(
              index: index,
            ),
          ],
        );
      } else {
        return Center(
          child: FadeTransition(
            opacity: _cursorAnimation,
            child: CustomPaint(
              size: const Size(0, 14),
              painter: CursorPainter(
                cursorColor: widget.hasError ? Colors.red : AppColors.primary,
                cursorWidth: 1,
              ),
            ),
          ),
        );
      }
    }
    return _renderPinField(
      index: index,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textField = Directionality(
      textDirection: widget.errorTextDirection,
      child: TextFormField(
        textInputAction: widget.textInputAction,
        controller: _textEditingController,
        focusNode: _focusNode,
        enabled: widget.enabled,
        autofillHints: widget.enablePinAutofill && widget.enabled
            ? <String>[AutofillHints.oneTimeCode]
            : null,
        autofocus: widget.autoFocus,
        autocorrect: false,
        keyboardType: widget.keyboardType,
        keyboardAppearance: widget.keyboardAppearance,
        textCapitalization: widget.textCapitalization,
        validator: widget.validator,
        onSaved: widget.onSaved,
        autovalidateMode: widget.autovalidateMode,
        inputFormatters: [
          ...widget.inputFormatters,
          LengthLimitingTextInputFormatter(
            widget.length,
          ), // this limits the input length
        ],
        // trigger on the complete event handler from the keyboard
        onFieldSubmitted: widget.onSubmitted,
        enableInteractiveSelection: false,
        showCursor: false,
        // using same as background color so tha it can blend into the view
        cursorWidth: 0.01,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          filled: false,
          fillColor: Colors.transparent,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        style: const TextStyle(
          color: Colors.transparent,
          height: .01,
          decoration: TextDecoration.none,
          fontSize: 0.01,
        ),
        scrollPadding: widget.scrollPadding,
        readOnly: widget.readOnly,
        obscureText: widget.obscureText,
      ),
    );

    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 56,
          minWidth: 56,
        ),
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            AbsorbPointer(
              child: widget.useExternalAutoFillGroup
                  ? textField
                  : AutofillGroup(
                      onDisposeAction: widget.onAutoFillDisposeAction,
                      child: textField,
                    ),
            ),
            GestureDetector(
              onTap: () {
                widget.onTap?.call();
                _onFocus();
              },
              onLongPress: () {},
              child: SizedBox(
                height: 56,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemCount: widget.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) {
                    final isSelected = ((_selectedIndex == i) ||
                            (_selectedIndex == i + 1 &&
                                i + 1 == widget.length)) &&
                        _focusNode!.hasFocus;

                    final isActiveOrSelected = isSelected || _selectedIndex > i;
                    return Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 56.r,
                          width: 56.r,
                          padding: const EdgeInsets.all(12),
                          decoration: widget.isUnderline
                              ? BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  border: isActiveOrSelected
                                      ? Border.all(
                                          color: widget.hasError
                                              ? Colors.red
                                              : AppColors.secondary,
                                        )
                                      : Border.all(
                                          color: AppColors.transparent))
                              : BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  border: isActiveOrSelected
                                      ? Border.all(
                                          color: widget.hasError
                                              ? Colors.red
                                              : AppColors.secondary,
                                        )
                                      : Border.all(
                                          color: AppColors.transparent)),
                          child: AnimatedContainer(
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 100),
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              // border: Border(
                              //   bottom: BorderSide(
                              //     color: widget.hasError
                              //         ? Colors.red
                              //         : isActiveOrSelected
                              //             ? AppColors.primaryColor
                              //             : Colors.grey,
                              //   ),
                              // ),
                            ),
                            child: AnimatedSwitcher(
                              switchInCurve: Curves.easeInOut,
                              switchOutCurve: Curves.easeInOut,
                              duration: const Duration(milliseconds: 100),
                              transitionBuilder: (child, animation) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                              child: buildChild(i),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onFocus() {
    if (widget.autoUnfocus) {
      if (_focusNode!.hasFocus &&
          MediaQuery.of(widget.appContext).viewInsets.bottom == 0) {
        _focusNode!.unfocus();
        Future.delayed(
          const Duration(microseconds: 1),
          () => _focusNode!.requestFocus(),
        );
      } else {
        _focusNode!.requestFocus();
      }
    } else {
      _focusNode!.requestFocus();
    }
  }

  Future<void> _setTextToInput(String data) async {
    final replaceInputList = List<String>.filled(widget.length, '');

    for (var i = 0; i < widget.length; i++) {
      replaceInputList[i] = data.length > i ? data[i] : '';
    }

    if (mounted) {
      setState(() {
        _selectedIndex = data.length;
        _inputList = replaceInputList;
      });
    }
  }
}

enum ErrorAnimationType { shake }

class CursorPainter extends CustomPainter {
  CursorPainter({this.cursorColor = Colors.black, this.cursorWidth = 2});

  final Color cursorColor;
  final double cursorWidth;

  @override
  void paint(Canvas canvas, Size size) {
    const p1 = Offset.zero;
    final p2 = Offset(0, size.height);
    final paint = Paint()
      ..color = cursorColor
      ..strokeWidth = cursorWidth;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
