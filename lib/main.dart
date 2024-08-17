import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_pay/app.dart';
import 'package:smart_pay/src/service/api/ssl_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  smartPayHttpClient = await SSlCertificateConfig().getSSLPinningClient();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      const ProviderScope(
        child: SmartPay(),
      ),
    ),
  );
}
