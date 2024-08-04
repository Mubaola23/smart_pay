import 'package:smart_pay/src/core/utils/common_libs.dart';
import 'package:smart_pay/src/shared/number-pad/components/number_btn.ui.dart';

class NumberPadUi extends StatelessWidget {
  const NumberPadUi({
    super.key,
    required this.onChanged,
    // required this.maxLength,
    required this.defaultValue,
    this.mainAxisAlignment,
    required this.onDeleteTap,
    this.faceTap,
  });
  final void Function(String) onChanged;
  final void Function() onDeleteTap;
  final Function()? faceTap;

  // final int maxLength;
  final String defaultValue;
  final MainAxisAlignment? mainAxisAlignment;

  void _appendValue(String val) {
    final newVal = '$defaultValue$val';

    onChanged(newVal);

    return;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: NumberBtnUi(
                text: '1',
                onTap: () {
                  _appendValue('1');
                },
              ),
            ),
            Expanded(
              child: NumberBtnUi(
                text: '2',
                onTap: () {
                  _appendValue('2');
                },
              ),
            ),
            Expanded(
              child: NumberBtnUi(
                text: '3',
                onTap: () {
                  _appendValue('3');
                },
              ),
            ),
          ],
        ),
        16.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: NumberBtnUi(
                text: '4',
                onTap: () {
                  _appendValue('4');
                },
              ),
            ),
            Expanded(
              child: NumberBtnUi(
                text: '5',
                onTap: () {
                  _appendValue('5');
                },
              ),
            ),
            Expanded(
              child: NumberBtnUi(
                text: '6',
                onTap: () {
                  _appendValue('6');
                },
              ),
            ),
          ],
        ),
        16.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: NumberBtnUi(
                text: '7',
                onTap: () {
                  _appendValue('7');
                },
              ),
            ),
            Expanded(
              child: NumberBtnUi(
                text: '8',
                onTap: () {
                  _appendValue('8');
                },
              ),
            ),
            Expanded(
              child: NumberBtnUi(
                text: '9',
                onTap: () {
                  _appendValue('9');
                },
              ),
            ),
          ],
        ),
        16.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: NumberBtnUi(
                text: '*',
                onTap: () {
                  _appendValue('*');
                },
              ),
            ),
            Expanded(
              child: NumberBtnUi(
                text: '0',
                onTap: () {
                  _appendValue('0');
                },
              ),
            ),
            Expanded(
              child: NumberBtnUi(
                iconString: AppImages.delete,
                isIcon: true,
                text: '',
                onTap: onDeleteTap,
              ),
            ),
          ],
        ),
        16.verticalSpace,
      ],
    );
  }
}
