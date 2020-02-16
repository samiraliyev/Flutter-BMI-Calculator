import 'package:bmi_calculator/ui/pages/add_date_page.dart';
import 'package:bmi_calculator/ui/pages/splash_page.dart';
import 'package:bmi_calculator/ui/router.dart';
import 'package:bmi_calculator/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
      // status bar icons' color
      systemNavigationBarIconBrightness: Brightness.dark, // bar icons' color
    ),
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BMI Calculator',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primaryColor,
        accentColor: AppColors.accentColor,
        textTheme: TextTheme(
          display1: GoogleFonts.heebo(
            color: AppColors.primaryColor,
            fontSize: 80,
            fontWeight: FontWeight.w700,
            height: 0.9,
          ),
          body1: GoogleFonts.heebo(
            color: AppColors.secondaryColor,
            fontSize: 31,
            fontWeight: FontWeight.w500,
          ),
          title: GoogleFonts.heebo(
            color: AppColors.primaryColor,
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
          subtitle: GoogleFonts.heebo(
            color: AppColors.subtitleColor,
            fontSize: 14,
          ),
          subhead: GoogleFonts.heebo(
            color: AppColors.subheadColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: SplashPage(),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
