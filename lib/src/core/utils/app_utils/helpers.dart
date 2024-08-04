import 'package:smart_pay/src/core/utils/common_libs.dart';

bool isEmpty(String? val) {
  return (val == null) || (val.trim().isEmpty);
}

bool isNotEmpty(String? val) {
  return !isEmpty(val);
}

bool isObjectEmpty(dynamic val) {
  if (val is Map) return val.isEmpty;
  if (val is List) return val.isEmpty;

  return (val == null);
}

bool isObject(dynamic val) {
  if (val is Map) return true;
  return false;
}

typedef JSON = Map<String, dynamic>;

Future<void> showSizeSheet(BuildContext context, Widget widget,
    {Color colors = Colors.white,
    bool dismissible = true,
    EdgeInsets? edgeInsets}) {
  return showModalBottomSheet<void>(
    isDismissible: dismissible,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
        return Wrap(
          children: [
            Container(
              margin: edgeInsets ?? EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r)),
              ),
              child: Center(
                child: widget,
              ),
            ),
          ],
        );
      });
    },
  );
}
