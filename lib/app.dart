import 'package:smart_pay/src/core/_core.dart';
import 'package:smart_pay/src/core/route/generate_route.dart';
import 'package:smart_pay/src/modules/startup/splash/view/splash_view.dart';

class SmartPay extends ConsumerWidget {
  const SmartPay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) => PopScope(
        onPopInvoked: (val) {
          AlertDialog(
            // title: new Text('Are you sure?'),
            content: const Text('Do you want to exit the App'),
            actions: <Widget>[
              
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),

              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Yes'),
              ),
            ],
          );
        },
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SmartPay',
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorKey: ref.read(navigationService).navigatorKey,
          initialRoute: SplashView.route,
          theme: AppColors.toThemeData(),
        ),
      ),
    );
  }
}
