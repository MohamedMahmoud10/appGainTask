import 'package:appgain/core/image_root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Core/app_style.dart';
import '../../../core/app_color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageRoot.splashScreen), fit: BoxFit.cover)),
      child: Center(
        child: Text(
          'Welcome',
          style: bodyStyle
        ),
      ),
    );
  }
}
