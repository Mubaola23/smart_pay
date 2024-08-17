import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;

HttpClient smartPayHttpClient = HttpClient();

class SSlCertificateConfig {
  Future<SecurityContext> get globalContext async {
// Loads the server certificate
    final sslCert = await rootBundle.load('assets/certs/certificate.pem');

    // Create a SecurityContext and set the trusted certificate
    SecurityContext context = SecurityContext(withTrustedRoots: false);
    context.setTrustedCertificatesBytes(sslCert.buffer.asUint8List());

    // Configure the HttpClient to use the SecurityContext

    return context;
  }

  Future<HttpClient> getSSLPinningClient() async {
    HttpClient client = HttpClient(context: await globalContext);
    // client.badCertificateCallback =
    //     (X509Certificate cert, String host, int port) => false;
    // IOClient ioClient = IOClient(client);

    return client;
  }
}
