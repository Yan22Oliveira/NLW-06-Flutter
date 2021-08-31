import 'package:flutter/material.dart';

import './modules/splash/splash_page.dart';
import './modules/login/login_page.dart';
import './shared/themes/themes.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Flow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      home: LoginPage(),
    );
  }
}
