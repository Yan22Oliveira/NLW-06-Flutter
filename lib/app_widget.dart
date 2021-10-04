import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './shared/models/models.dart';
import './shared/themes/themes.dart';

import './modules/barcode_scanner/barcode_scanner_page.dart';
import './modules/home/home_page.dart';
import './modules/insert_boleto/insert_boleto_page.dart';
import './modules/splash/splash_page.dart';
import './modules/login/login_page.dart';

class AppWidget extends StatelessWidget {

  AppWidget(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Flow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.primary,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashPage(),
        '/home':   (context) => HomePage(
          user: ModalRoute.of(context)!.settings.arguments as UserModel,
        ),
        '/login':  (context) => LoginPage(),
        '/barcode_scanner':  (context) => BarcodeScannerPage(),
        '/insert_boleto':    (context) => InserteBoletoPage(
          barcode: ModalRoute.of(context)!.settings.arguments != null ?
              ModalRoute.of(context)!.settings.arguments as String:
              null,
        ),
      },
    );
  }

}