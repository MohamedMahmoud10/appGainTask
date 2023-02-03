import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color.dart';
import 'app_style.dart';

class Themes {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor:Colors.cyan,
          systemNavigationBarDividerColor:Colors.red,
      systemNavigationBarContrastEnforced:false ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppColor.lightBlue,
      unselectedItemColor: AppColor.darkGrey,
      selectedLabelStyle: bodyStyle2.copyWith(
        fontSize: 12.sp,
      ),
      unselectedLabelStyle: bodyStyle2.copyWith(fontSize: 12.sp),

      //unselectedIconTheme: IconThemeData(color: Colors.black),
    ),
  );
}
