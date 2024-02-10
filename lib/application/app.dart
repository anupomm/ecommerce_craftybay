import 'package:ecommerce/presentation/ui/screens/splash_screen.dart';
import 'package:ecommerce/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      theme: ThemeData(
        primarySwatch: MaterialColor(AppColors.primaryColor.value, AppColors().color),
      ),
    );
  }
}
