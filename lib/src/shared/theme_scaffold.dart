import 'package:smart_pay/src/core/_core.dart';

class ThemeScaffold extends StatelessWidget {
  const ThemeScaffold({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Theme(
          data: AppColors.toThemeData(),
          // Provide a default texts style to allow Hero's to render text properly
          child: DefaultTextStyle(
            // style: Ap,
            // Use a custom scroll behavior across entire app
            style: body,
            child: ScrollConfiguration(
              behavior: AppScrollBehavior(),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
