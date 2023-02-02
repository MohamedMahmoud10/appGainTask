import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

TextStyle get titleStyle {
  return GoogleFonts.lato(
    fontSize: 19.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.white,
  );
}

TextStyle get bodyStyle {
  return GoogleFonts.lobster(
    fontSize: 70.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.white,
  );
}

TextStyle get bodyStyle1 {
  return GoogleFonts.lato(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColor.greyPrimary,
  );
}

TextStyle get bodyStyle2 {
  return GoogleFonts.lato(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.lightBlue,
  );
}

TextStyle get bodyStyle3 {
  return GoogleFonts.lato(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: AppColor.white,
  );
}

// 100 - Thin
// 200 - Extra Light (Ultra Light)
// 300 - Light
// 400 - Normal
// 500 - Medium
// 600 - Semi Bold (Demi Bold)
// 700 - Bold
// 800 - Extra Bold (Ultra Bold)
// 900 - Black (Heavy)
