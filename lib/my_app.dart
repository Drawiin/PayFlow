import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay_flow/modules/barcode_scanner/barcode_scanner_screen.dart';
import 'package:pay_flow/modules/home/home_screen.dart';
import 'package:pay_flow/modules/insert_invoice/insert_invoice_screen.dart';
import 'package:pay_flow/shared/models/user_model.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/values/app_routes.dart';

import 'modules/login/login_screen.dart';
import 'modules/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  MyApp() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.primary));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: AppColors.primary, primarySwatch: Colors.orange),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.home: (context) => HomeScreen(
            user: ModalRoute.of(context)!.settings.arguments as UserModel),
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.splash: (context) => SplashScreen(),
        AppRoutes.barcodeScanner: (context) => BarcodeScannerScreen(),
        AppRoutes.insetInvoice: (context) => InsertInvoiceScreen(
              barcode: ModalRoute.of(context) != null
                  ? ModalRoute.of(context)!.settings.arguments.toString()
                  : null,
            ),
      },
    );
  }
}
