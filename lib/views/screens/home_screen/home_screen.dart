import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_pagination/flutter_pagination.dart';
import 'package:flutter_pagination/widgets/button_styles.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart' show PlatformException;

import '../../../controllers/cubit/home_page_cubit.dart';
import '../../../controllers/cubit/home_page_states.dart';
import 'Components/home_screen_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => {FlutterNativeSplash.remove()});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<HomePageCubit, HomePageStates>(
        builder: (context, state) {
          var cubit = HomePageCubit.get(context);
          if (cubit.popularMovies?.results != null) {
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: cubit.popularMovies!.results!.length,
                    itemBuilder: (context, index) {
                      return HomeScreenView(
                        results: cubit.popularMovies!.results![index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),
                Pagination(
                  width: MediaQuery.of(context).size.width * 0.95,
                  // this prop is optional
                  onPageChange: (number) async {
                    cubit.onPageChanged(number);
                    await cubit.getAllMovies();
                  },
                  useGroup: true,
                  totalPage: cubit.popularMovies!.totalPages!,
                  show: 4,
                  currentPage: cubit.currentPage,
                  prevButtonStyles: PaginateSkipButton(),
                  nextButtonStyles: PaginateSkipButton(),
                  paginateButtonStyles:
                      PaginateButtonStyles(backgroundColor: Colors.red),
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
