import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutterahmad/binding/initialbinding.dart';
import 'package:flutterahmad/core/funcation/fcmconfig.dart';
import 'package:flutterahmad/core/localization/changlocal.dart';
import 'package:flutterahmad/core/localization/translation.dart';
import 'package:flutterahmad/core/services/service.dart';
import 'package:flutterahmad/core/stripe_payment/stripe_key.dart';
import 'package:flutterahmad/routes.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    return client;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey=StripeKey.stripePublishableKey;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  RequestPermissoinNotification();
  await InitialService();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Mytranslation(),
      title: 'Flutter Demo',
      theme:controller.appTheme,
      initialBinding: InitialBindings(),
      locale: controller.language,
      getPages:routes,
    );
  }
}
