import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:smart_pay/src/core/utils/app_colors.dart';

class Skeleton extends StatelessWidget {
  final bool? automaticallyImplyLeading;
  final bool? isBusy;
  final Color? backgroundColor;
  final String? appBarTitle;
  final TextStyle? appBarTitleStyle;
  final Widget? body;
  final Widget? floatingActionButton;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? belowOverlayChild;
  final List<Widget>? appBarActions;
  final Widget? appBarLeading;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final EdgeInsets? bodyPadding;
  final Widget? appBarTitleWidget;
  final BoxConstraints? constraints;
  final bool? centerTitle;
  final String? busyText;
  final double? leadingWidth;
  final PreferredSizeWidget? appBar;
  final bool? isAuthSkeleton;

  const Skeleton(
      {super.key,
      required this.isBusy,
      this.automaticallyImplyLeading = true,
      this.backgroundColor,
      this.appBarTitle,
      this.appBarTitleStyle,
      required this.body,
      this.floatingActionButton,
      this.floatingActionButtonAnimator,
      this.floatingActionButtonLocation,
      this.belowOverlayChild,
      this.appBarActions,
      this.appBarLeading,
      this.drawer,
      this.endDrawer,
      this.bottomNavigationBar,
      this.bottomSheet,
      this.bodyPadding,
      this.appBarTitleWidget,
      this.constraints,
      this.centerTitle = false,
      this.busyText,
      this.leadingWidth,
      this.appBar,
      this.isAuthSkeleton = true});

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      opacity: 0.6,
      color: Colors.white,
      progressIndicator: const SizedBox(
          height: 100,
          width: 100,
          child: CircularProgressIndicator(
            color: AppColors.primary,
          )),
      isLoading: isBusy!,
      child: IgnorePointer(
        ignoring: isBusy!,
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Scaffold(
                resizeToAvoidBottomInset: isAuthSkeleton,
                backgroundColor: backgroundColor,
                appBar: appBar,
                body: Container(
                  height: ScreenUtil().screenHeight,
                  width: ScreenUtil().screenWidth,
                  padding: bodyPadding ??
                      const EdgeInsets.symmetric(horizontal: 24).r,
                  child: body,
                ),
                floatingActionButton: floatingActionButton,
                floatingActionButtonAnimator: floatingActionButtonAnimator,
                floatingActionButtonLocation: floatingActionButtonLocation,
                drawer: drawer,
                endDrawer: endDrawer,
                bottomNavigationBar: bottomNavigationBar,
                bottomSheet: bottomSheet,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
