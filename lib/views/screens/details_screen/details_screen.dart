
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controllers/cubit/home_page_cubit.dart';
import '../../../controllers/cubit/home_page_states.dart';
import 'Components/movie_detail_view.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({Key? key
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Container(
      //   color: Colors.transparent,
      //   margin: const EdgeInsets.all(10),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       CustomButton(
      //         onTap: () {},
      //         borderRadius: 10,
      //         boxShape: BoxShape.rectangle,
      //         color: Colors.red,
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: const [Icon(Icons.favorite), Text('Add To WishList')],
      //         ),
      //       ),
      //       CustomButton(
      //           onTap: () {},
      //           borderRadius: 5,
      //           boxShape: BoxShape.circle,
      //           color: Colors.red,
      //           child: const Icon(Icons.play_arrow))
      //     ],
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<HomePageCubit, HomePageStates>(
            listener: (context, state) {
              // TODO: implement listener
            },
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
