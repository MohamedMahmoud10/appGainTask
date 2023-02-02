import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:appgain/Utils/helpers_fun.dart';
import 'package:appgain/business_logic/cubit/home_page_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Core/theme.dart';
import 'Presentation/screens/home_screen/home_screen.dart';
import 'Presentation/screens/splash_screen/splash_screen.dart';
import 'business_logic/bloc_opserver.dart';
import 'data/Network/Remote/dio_helper.dart';
Future<void> backGroundMessage(RemoteMessage message) async {
  print('THANKYOU');
  print('${message.notification!.body}');
}
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var token =await FirebaseMessaging.instance.getToken();
  printMessage('$token');
  FirebaseMessaging.onMessage.listen((event) {
    printMessage('${event.data}');
  }).onError((error){
    printMessage('$error');
  });
  //WHEN CLICK NOTIFICATION TO OPEN APP
  FirebaseMessaging.onMessageOpenedApp.listen((event) { });
  //BACKGROUND FCM
  FirebaseMessaging.onBackgroundMessage(backGroundMessage);
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context)=>HomePageCubit()..getAllMovies())
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: Themes.lightTheme,
              home: AnimatedSplashScreen(
                splashIconSize:double.infinity ,
                splash: const SplashScreen(),
                nextScreen: const HomeScreen(),
              ),
            ),
          );
        });
  }
}
