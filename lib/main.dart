import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import './state/user_state.dart';
import './routes/app_route.dart';
import './common/config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final userC = Get.put(UserState());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fishery',
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: primaryColor,
        textTheme: GoogleFonts.poppinsTextTheme(),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          unselectedItemColor: secondaryTextColor,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: primaryColor,
          selectionColor: primaryColor.withOpacity(0.5),
          selectionHandleColor: primaryColor,
        ),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: mainTextColor),
        ),
      ),
      getPages: AppRoute.pages,
    );
  }
}
