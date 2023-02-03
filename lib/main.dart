import 'package:appgain/Utils/helpers_fun.dart';
import 'package:appgain/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Core/theme.dart';
import 'controllers/bloc_opserver.dart';
import 'data/Network/Remote/dio_helper.dart';

Future<void> backGroundMessage(RemoteMessage message) async {
  debugPrint('${message.notification!.body}');
}

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);  await Firebase.initializeApp();
  var token = await FirebaseMessaging.instance.getToken();
  printMessage('$token');
  FirebaseMessaging.onMessage.listen((event) {
    printMessage('${event.data}');
  }).onError((error) {
    printMessage('$error');
  });
  //WHEN CLICK NOTIFICATION TO OPEN APP
  FirebaseMessaging.onMessageOpenedApp.listen((event) {});
  //BACKGROUND FCM
  FirebaseMessaging.onBackgroundMessage(backGroundMessage);
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(
      appRouter: AppRouter(),
      ));
}


class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.appRouter,
  });

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: Themes.lightTheme,
            onGenerateRoute: appRouter.generateRoute,
          );
        });
  }
}
