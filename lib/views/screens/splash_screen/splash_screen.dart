// import 'dart:async';
//
// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:appgain/Presentation/screens/home_screen/home_screen.dart';
// import 'package:appgain/Utils/helpers_fun.dart';
// import 'package:appgain/core/image_root.dart';
// import 'package:flutter/material.dart';
//
// import '../../../Core/app_style.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   // @override
//   // void initState() {
//   //   // Timer(Duration(seconds: 3), () {
//   //   //   Navigator.of(context).pushNamed('/home');
//   //   }) ;super.initState();
//   //}
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return AnimatedSplashScreen(
//       splash: Material(
//         child: Container(
//           width: size.width,
//           height: size.height,
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage(ImageRoot.splashScreen),
//                   fit: BoxFit.cover)),
//           child: Center(
//             child: Text('Welcome', style: bodyStyle),
//           ),
//         ),
//       ),
//       nextScreen: HomeScreen(),
//     );
//   }
// }
