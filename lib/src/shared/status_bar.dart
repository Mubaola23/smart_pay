import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

enum StatusBarType { light, dark }

extension StatusBarTypeExtension on StatusBarType {
  bool get isLight => this == StatusBarType.light;
  bool get isDark => this == StatusBarType.dark;
}

class StatusBar extends StatelessWidget {
  const StatusBar({
    required this.child,
    super.key,
  }) : statusBarType = StatusBarType.light;

  const StatusBar.dark({
    required this.child,
    super.key,
  }) : statusBarType = StatusBarType.dark;
  final StatusBarType statusBarType;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: Get.isDarkMode
          ? SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor:
                  Theme.of(context).scaffoldBackgroundColor,
              systemNavigationBarIconBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.light,
            )
          : SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor:
                  Theme.of(context).scaffoldBackgroundColor,
              systemNavigationBarIconBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark,
            ),
      child: child,
    );
  }
}
