

import 'package:appgain/views/screens/details_screen/details_screen.dart';
import 'package:appgain/views/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'controllers/cubit/home_page_cubit.dart';
import 'data/Network/Remote/dio_helper.dart';

class AppRouter {
  late HomePageCubit movieCubit;

  AppRouter() {
    movieCubit = HomePageCubit(DioHelper());
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                      create: (_) => movieCubit..getAllMovies(),
                      child: const HomeScreen(),
                    )));
      case '/detailsScreen':
        final id = settings.arguments as int;
        return MaterialPageRoute(
            builder: (context) =>
            BlocProvider<HomePageCubit>.value(
              value: movieCubit..getMovieDetails(id: id),
              child: const MovieDetailsScreen(),
            ));
    }
    return null;
  }
}
