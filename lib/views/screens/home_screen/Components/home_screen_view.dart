import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../controllers/cubit/home_page_cubit.dart';
import '../../../../core/app_color.dart';
import '../../../../core/app_style.dart';
import '../../../../core/end_point.dart';
import '../../../../models/popular_movies.dart';
import '../../details_screen/details_screen.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key, required this.results}) : super(key: key);
  final Results results;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
        onTap: () async {
          await BlocProvider.of<HomePageCubit>(context)
              .getMovieDetails(id: results.id!);
          Navigator.of(context).pushNamed('/detailsScreen',arguments: results.id);
        },
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height / 2.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        '$imagePath${results.posterPath}'),
                    fit: BoxFit.cover),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: size.width,
                color: AppColor.greyColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.play_circle_fill_rounded)),
                    Expanded(
                      child: Text(
                        results.title!,
                        style: titleStyle,
                        maxLines: 1,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                results.overview!,
                style: bodyStyle1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Released:${results.releaseDate!}',
                    style: bodyStyle2,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
