import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controllers/cubit/home_page_cubit.dart';
import '../../../controllers/cubit/home_page_states.dart';
import 'Components/movie_detail_view.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<HomePageCubit, HomePageStates>(
            builder: (context, state) {
              var cubit = HomePageCubit.get(context);
              if (cubit.movieDetailsModel != null) {
                return MovieDetailView(
                  movieDetailsModel: cubit.movieDetailsModel!,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
