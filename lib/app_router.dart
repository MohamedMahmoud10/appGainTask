// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:appgain/business_logic/cubit/home_page_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// import 'Presentation/screens/details_screen/details_screen.dart';
// import 'Presentation/screens/home_screen/home_screen.dart';
// import 'Presentation/screens/splash_screen/splash_screen.dart';
//
// class AppRouter {
//   late HomePageCubit movieCubit;
//
//   AppRouter() {
//     movieCubit = HomePageCubit();
//   }
//
//   Route? generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case '/':
//         return MaterialPageRoute(
//             builder: ((context) =>
//                 BlocProvider(
//                   create: (context) => movieCubit..getAllMovies(),
//                   child: AnimatedSplashScreen(
//                     splash: const SplashScreen(),
//                     nextScreen: const HomeScreen(),
//                   ),))
//         );
//       case '/detailsScreen':
//         return MaterialPageRoute(
//             builder: (_) =>
//                 BlocProvider(
//                   create: (BuildContext ctx) => movieCubit,
//                   child: const MovieDetailsScreen(),
//                 ));
//     }
//     return null;
//   }
// }
